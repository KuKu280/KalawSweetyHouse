//
//  NibBasedControl.swift
//  KalawSweetyHouse
//
//  Created by Ku Ku Zan on 12/18/23.
//

import UIKit

public class NibBasedControl: UIControl, NibLoadableViewProtocol {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        loadAndAttachNib()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadAndAttachNib()
    }
    
    public var nibOrNil: UINib? {
        nil
    }
    
    public var nibContainerView: UIView? {
        self
    }
    
    
}
