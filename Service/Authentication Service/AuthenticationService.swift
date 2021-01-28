//
//  AuthenticationService.swift
//  DAWAuth
//

public extension AuthenticationService {
    
    func requestPasswordForAuth(to email: String, completion: @escaping(Result<Bool, NetworkError>) -> Void) {
        guard let url = URL(string: Configuration.targetConstants.api + "/accounts/reset-password") else {
            completion(.failure(.badUrl))
            return 
        }
        
        let parameters: [String: Any] = ["email": email]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue(ConstantsHolder.applicationId, forHTTPHeaderField: "Application-Id")
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])
            
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let response = response as? HTTPURLResponse,
               200...300 ~= response.statusCode  {
                completion(.success(true))
            } else { completion(.failure(.unknown))}
        }.resume()
    }
}
