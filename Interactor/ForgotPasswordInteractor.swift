//
//  ForgotPasswordInteractor.swift
//  DAWAuth
//

import Foundation

final public class ForgotPasswordInteractor {
    
    // MARK: - Properties
    
    weak public var output: ForgotPasswordInteractorOutput?
    private let authenticationService: AuthenticationService
    
    public init(authenticationService: AuthenticationService) {
        self.authenticationService = authenticationService
    }

}

extension ForgotPasswordInteractor: ForgotPasswordInteractorInput {
    
    public func resetPassword(for email: String) {
        authenticationService.requestPasswordForAuth(to: email) { [weak self] (result) in
            switch result {
            case .success:
                self?.output?.resetDidSucceed()
            case .failure(let error):
                print(error.localizedDescription)
                self?.output?.resetDidFail()
            }
        }
    }
}
