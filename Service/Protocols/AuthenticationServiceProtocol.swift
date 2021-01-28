//
//  AuthenticationService.swift
//  DAWAuth
//


public protocol AuthenticationService: class {
    
    func requestPasswordForAuth(to email: String, completion: @escaping(Result<Bool, NetworkError>) -> Void)
}
