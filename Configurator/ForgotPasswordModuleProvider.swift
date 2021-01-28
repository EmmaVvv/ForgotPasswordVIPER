//
//  ForgotPasswordModuleProvider.swift
//  DAWAuth
//

import Foundation

final public class ForgotPasswordModuleProvider {
    
    static public func provideConfiguredViewController(with state: AuthenticationState) -> ForgotPasswordViewController {
        let viewInput = ForgotPasswordViewController()
        viewInput.title = "Забыли пароль?"
        let configurator = ForgotPasswordConfigurator()
        configurator.configureModuleForViewInput(viewInput: viewInput)
        let moduleInput = (viewInput.output as? ConfirmCodeModuleInput)
        moduleInput?.set(state)
        return viewInput
    }
    
}
