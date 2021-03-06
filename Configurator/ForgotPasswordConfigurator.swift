//
//  ForgotPasswordConfigurator.swift
//  DAWAuth
//

import Foundation

public final class ForgotPasswordConfigurator {
    
    public init() {}

    public func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {
        
        if let viewController = viewInput as? ForgotPasswordViewController {
            configure(viewController: viewController)
        }
    }
    
    private func configure(viewController: ForgotPasswordViewController) {
        
        let router = ForgotPasswordRouter()
        router.transitionHandler = viewController
        
        let presenter = ForgotPasswordPresenter()
        presenter.view = viewController
        presenter.router = router
             
        let interactor = ForgotPasswordInteractor(authenticationService: Configuration.authenticationService)
        interactor.output = presenter
        
        presenter.interactor = interactor
        viewController.output = presenter
    }
}
