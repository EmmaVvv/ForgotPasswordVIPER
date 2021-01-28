//
//  ForgotPasswordPresenter.swift
//  DAWAuth
//

import UIKit

public class ForgotPasswordPresenter {
    
    // MARK: - Properties
    
    weak public var view: ForgotPasswordViewInput?
    public var router: ForgotPasswordRouterInput!
    public var interactor: ForgotPasswordInteractorInput!

    
    var state: AuthenticationState!

    // MARK: - Init
    public init() { }
}

extension ForgotPasswordPresenter: ForgotPasswordViewOutput {

    public func viewIsReady() {
        view?.setupInitialState(with: state.emailAddress)
    }
    
    public func proceedToPasswordEntering() {
        interactor.resetPassword(for: state.emailAddress)
    }
}

extension ForgotPasswordPresenter: ForgotPasswordInteractorOutput {
    
    public func resetDidSucceed() {
        router.proceedToEnterPasswordPage(with: state, title: "Введите\nпароль из письма")
    }
    
    public func resetDidFail() {
        view?.showPasswordResetError()
    }
    
}

extension ForgotPasswordPresenter: ConfirmCodeModuleInput {
    
    public func set(_ state: AuthenticationState) {
        self.state = state
    }
}
