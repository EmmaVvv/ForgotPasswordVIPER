//
//  ForgotPasswordRouter.swift
//  DAWAuth
//

import UIKit

public class ForgotPasswordRouter: ForgotPasswordRouterInput {
    
    weak var transitionHandler: TransitionHandler?
    
    public func proceedToEnterPasswordPage(with state: AuthenticationState, title: String) {
        self?.transitionHandler?.push(ConfirmEmailModuleProvider.provideConfiguredViewController(with: state, title: title), animated: true)
    }
}
