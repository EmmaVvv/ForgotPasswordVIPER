//
//  ForgotPasswordInteractorInput.swift
//  DAWAuth
//

import Foundation

public protocol ForgotPasswordInteractorInput {
    
    func resetPassword(for email: String)
    
}
