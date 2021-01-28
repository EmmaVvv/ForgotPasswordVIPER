//
//  ForgotPasswordInteractorOutput.swift
//  DAWAuth
//
import Foundation

public protocol ForgotPasswordInteractorOutput: class {
    
    func resetDidSucceed()
    func resetDidFail()

}
