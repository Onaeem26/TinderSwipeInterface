//
//  PresentDetailViewControllerTransitionAnimation.swift
//  TinderStack
//
//  Created by Osama Naeem on 20/03/2019.
//  Copyright © 2019 NexThings. All rights reserved.
//

import UIKit

class PresentDetailViewControllerTransitionAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    
    var selectedFrame : CGRect  = .zero

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        guard let fromViewController = transitionContext.viewController(forKey: .from) as? ViewController, let toViewController = transitionContext.viewController(forKey: .to) as? DetailViewController else { return }
        
        
        containerView.addSubview(toViewController.view)
        toViewController.configurePositionOfContainer(left: 20, right: 20, top: selectedFrame.origin.y + 20, bottom: 0.0)
        
         let duration = transitionDuration(using: transitionContext)
        UIView.animate(withDuration: duration, animations: {
            toViewController.configurePositionOfContainer(left: 0.0,
                                               right: 0.0,
                                               top: 0.0,
                                               bottom: 0.0)
        }){ (_) in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
    
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 3.5
    }
    
    
}
