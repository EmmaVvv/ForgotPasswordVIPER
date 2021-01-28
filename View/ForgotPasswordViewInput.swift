//
//  ForgotPasswordViewInput.swift
//  DAWAuth
//

import UIKit

public protocol ForgotPasswordViewInput: class {
    
    func setupInitialState(with email: String)
    func showPasswordResetError()
}
