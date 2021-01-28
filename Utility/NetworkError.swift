//
//  NetworkError.swift
//  DAWAuth
//

import Foundation

public enum NetworkError: Error, Equatable {
    case unknown
    case phoneBlocked
    case noData
    case badUrl
    case badJSON
    case userNotFound
    case noToken
    case userNotVerified
    case invalidCode
    case errorWith(message: String)
}
