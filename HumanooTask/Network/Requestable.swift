//
//  Requestable.swift
//  HumanooTask
//
//  Created by Marwan Ayman on 21.02.21.
//

import Foundation.NSURLSession

typealias Parameters = [String: Any]
typealias RequestCompletion = (_ response: Any?, _ error: NSError?) -> Void

protocol Requestable {
    var method: HTTPMethod { get }
    var path: String { get }
    var baseURL: String { get }
    var parameters: Parameters? { get }
    func request<T: Decodable>(completion: @escaping (Result<T, Error>) -> Void)
}

extension Requestable {

    // method is get by default 🙄
    var method: HTTPMethod {
        return .get
    }

    var baseURL: String {
        return ""//Constants.baseURl
    }

    func request<T: Decodable>(completion: @escaping (Result<T, Error>) -> Void) {
        let session = URLSession(configuration: .default)
        session.dataLoadingTask(with: asURLRequest()) { (result) in
            switch result {
            case .success(let (response, data)):
                guard let statusCode = (response as? HTTPURLResponse)?.statusCode, 200..<299 ~= statusCode else {
                    let error = NSError(domain: "Invalid API", code: (response as? HTTPURLResponse)?.statusCode ?? 400, userInfo: nil)
                     DispatchQueue.main.async {
                        completion(.failure(error))
                    }
                    return
                }
                do {
                    let decoder = JSONDecoder()
                    let values = try decoder.decode(T.self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(values))
                    }
                } catch let error {
                    DispatchQueue.main.async {
                        completion(.failure(error))
                    }
                }
            case .failure(let error ):
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }.resume()
    }

    private func asURLRequest() -> URLRequest {
        var url = URL.init(string: baseURL)
        if !path.isEmpty {
            url = url?.appendingPathComponent(path)
        }
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = method.rawValue
        return encode(urlRequest, with: parameters)
    }

    private func encode(_ request: URLRequest, with parameters: Parameters?) -> URLRequest {
        var urlRequest = request
        guard let parameters = parameters else { return urlRequest }
        switch self.method {
        case .get:
            if var urlComponents = URLComponents(string: urlRequest.url?.absoluteString ?? "") {
                urlComponents.queryItems = getQueryItems(for: urlRequest.url?.absoluteString ?? "", parameters: parameters)
                urlRequest.url = urlComponents.url
            }
        case .post:
            do {
                let data = try NSKeyedArchiver.archivedData(withRootObject: parameters, requiringSecureCoding: false)
                urlRequest.httpBody = data
            } catch let error {
                print(error.localizedDescription)
            }
        default: break
        }
        return urlRequest
    }

    private func getQueryItems(for url: String, parameters: [String: Any]?) -> [URLQueryItem] {
        guard let parameters = parameters as? [String: String] else { return [URLQueryItem]() }
        let queryItems = parameters.map { param in
            return URLQueryItem(name: param.key, value: param.value)
        }
        return queryItems
    }
}

