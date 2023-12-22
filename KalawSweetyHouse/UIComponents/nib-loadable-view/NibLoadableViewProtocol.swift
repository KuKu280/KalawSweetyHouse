//
//  NibLoadableViewProtocol.swift
//  KalawSweetyHouse
//
//  Created by Ku Ku Zan on 12/11/23.
//

import UIKit

public protocol NibLoadableViewProtocol: UIView {
    var nibOrNil: UINib? { get }
    var nibContainerView: UIView? { get }
    func loadAndAttachNib()
}

public extension NibLoadableViewProtocol {
    
    private func simpleClassName(
        from anyClass: AnyClass
    ) -> String {
        return NSStringFromClass(anyClass)
            .split(separator: ".")
            .map(String.init).last ?? ""
    }
    
    private func nibFileWithClassName() -> UINib {
        UINib(
            nibName: simpleClassName(
                from: self.classForCoder
            ),
            bundle: Bundle(for: self.classForCoder)
        )
    }
    
    private func givenOrAutoResolvedNibFile() -> UINib {
        nibOrNil ?? nibFileWithClassName()
    }
    
    func loadAndAttachNib() {
        let nib = givenOrAutoResolvedNibFile()
        
        let objects = nib.instantiate(
            withOwner: self, options: nil
        )
        
        guard let container = nibContainerView else { return }
        
        let views = objects.compactMap{ $0 as? UIView }
        
        for view in views {
            view.backgroundColor = .clear
            
            container.addSubview(view)
            
            NSLayoutConstraint.activate([
                view.leadingAnchor.constraint(
                    equalTo: container.leadingAnchor,
                    constant: 0
                ),
                view.trailingAnchor.constraint(
                    equalTo: container.trailingAnchor,
                    constant: 0
                ),
                view.topAnchor.constraint(
                    equalTo: container.topAnchor,
                    constant: 0
                ),
                view.bottomAnchor.constraint(
                    equalTo: container.bottomAnchor,
                    constant: 0
                )
            ])
        }
        
        awakeFromNib()
    }
}
