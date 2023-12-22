//
//  DimmingBackgroundPresentationController.swift
//  KalawSweetyHouse
//
//  Created by Ku Ku Zan on 12/22/23.
//

import Foundation
import UIKit

public final class DimmingBackgroundPresentationController: UIPresentationController {
    
    let overlayView = UIView()
    
    public override init(
        presentedViewController: UIViewController,
        presenting presentingViewController: UIViewController?
    ) {
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
    }
}

extension DimmingBackgroundPresentationController {
    
    public override var presentationStyle: UIModalPresentationStyle {
        .overFullScreen
    }
    
    public override var adaptivePresentationStyle: UIModalPresentationStyle {
        self.presentationStyle
    }
    
    public override func presentationTransitionWillBegin() {
        // insert overlay view to containerView
        guard let containerView else { return }
        containerView.insertSubview(overlayView, at: 0)
        
        //1. overlayView constraintlayout
        overlayView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            overlayView.topAnchor.constraint(
                equalTo: containerView.topAnchor
            ),
            overlayView.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor
            ),
            overlayView.bottomAnchor.constraint(
                equalTo: containerView.bottomAnchor
            ),
            overlayView.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor
            )
        ])
        // 2. overlay view background color
        overlayView.backgroundColor = .clear
        
        guard let coordinator = presentedViewController.transitionCoordinator
        else { return }
        let couldAnimateAlong = coordinator.animate { [overlayView] _ in
            overlayView.backgroundColor = .black
                .withAlphaComponent(0.5)
        }
        
        if !couldAnimateAlong {
            UIView.animate(withDuration: 0.25) {
                [overlayView] in
                    overlayView.backgroundColor = .black
                        .withAlphaComponent(0.5)
            }
        }
    }
    
    public override func dismissalTransitionWillBegin() {
        guard let coordinator = presentedViewController.transitionCoordinator
        else { return }
        let couldAnimateAlong = coordinator.animate { [overlayView] _ in
            overlayView.backgroundColor = .clear
        }
    }
    
    public override func dismissalTransitionDidEnd(_ completed: Bool) {
        overlayView.removeFromSuperview()
    }
}
