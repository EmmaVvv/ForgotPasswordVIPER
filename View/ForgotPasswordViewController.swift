//
//  ForgotPasswordViewController.swift
//  DAWAuth
//

import UIKit

public class ForgotPasswordViewController: AuthenticationFlowViewController<ForgotPasswordView>, TransitionHandler {
    
    // MARK: - Properties
    
    public var output: ForgotPasswordViewOutput!

    public override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    open func setupInitialState(with email: String) {
        rootView.mailView.configureLabel(with: .future(email: email))
        rootView.proceedButton.setTitle("Отправить пароль", with: .black)
        rootView.proceedButton.addTarget(self, action: #selector(sendPassword), for: .touchUpInside)
    }
    
    // MARK: - Selectors
    
    @objc private func sendPassword() {
        output.proceedToPasswordEntering()
        rootView.proceedButton.isEnabled = false
    }
}

extension ForgotPasswordViewController: ForgotPasswordViewInput {
    public func isProceedButton(enabled: Bool) {
        rootView.proceedButton.isEnabled = enabled
    }
    
    public func showPasswordResetError() {
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(200)) { [weak self] in
            self?.showAlertMessage(with: "Возникла ошибка. Попробуйте авторизоваться позже", message: nil)
        }
    }
}
