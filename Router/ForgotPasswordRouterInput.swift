//
//  ForgotPasswordRouterInput.swift
//  DAWAuth
//

import UIKit

public protocol ForgotPasswordRouterInput {
    
    func proceedToEnterPasswordPage(with state: AuthenticationState, title: String)
}
