//
//  TransitionHandler.swift
//  DAWAuth
//

import UIKit

public protocol TransitionHandler: class {
    
    func present(_ viewController: UIViewController, animated: Bool)
    func push(_ viewController: UIViewController, animated: Bool)
    
    func pop(animated: Bool)
    
    func setRoot(_ viewController: UIViewController, animated: Bool)
    
}

extension TransitionHandler where Self: UIViewController {
    
    public func present(_ viewController: UIViewController, animated: Bool) {
        present(viewController, animated: animated, completion: nil)
    }
       
    public func push(_ viewController: UIViewController, animated: Bool) {
        navigationController?.pushViewController(viewController, animated: animated)
    }
    
    public func pop(animated: Bool) {
        navigationController?.popViewController(animated: animated)
    }
    
    public func setRoot(_ viewController: UIViewController, animated: Bool) {
        navigationController?.setViewControllers([viewController], animated: true)
    }
    
}
