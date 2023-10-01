//
//  APIManager.swift
//  Shopping
//
//  Created by INI SYSTEMS on 01/10/23.
//

import Foundation

enum APIError: Error {
    
    case InvalidURL
    case InvalidURLRequest
    
}

class APIManager: NSObject {
    
    static let `default` = APIManager()
    
    fileprivate var completion: ((Data?, Error?) -> ())?
    
    func fetchDataFromAPI(api apiURL: String, timeout: TimeInterval = 30.0, completion: @escaping (Data?, Error?) -> ()) {
        self.completion = completion
        let urlStr = apiURL
        var request: URLRequest? = nil
        guard let url = URL(string: urlStr) else {
            completion(nil, APIError.InvalidURL)
            return
        }
        request = URLRequest(url: url)
        if request != nil {
            request?.httpShouldHandleCookies = false
            let configuration = URLSessionConfiguration.default
            if timeout > 0.0 {
                configuration.timeoutIntervalForRequest = timeout
                configuration.timeoutIntervalForResource = timeout + 0.5
            }
            let session = URLSession(configuration: configuration, delegate: self, delegateQueue: nil)
            let postDataTask = session.dataTask(with: request!, completionHandler: { data, response, error in
                DispatchQueue.main.async {
                    completion(data, error)
                }
            })
            postDataTask.resume()
        } else {
            completion(nil, APIError.InvalidURLRequest)
        }
    }
    
}

extension APIManager: URLSessionDelegate {
    
    public func connection(_ connection: NSURLConnection, didFailWithError error: Error) {
        print("Connection failed: \(error)")
        //(self.delegate as? APIRequestHandleDelegate)?.error!(forObject: self, andError: error)
        completion?(nil, error)
    }
    
    public func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        if challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust {
            //if challenge.protectionSpace.host == "mydomain.com" {
                let credential = URLCredential(trust: challenge.protectionSpace.serverTrust!)
                completionHandler(URLSession.AuthChallengeDisposition.useCredential, credential)
            //}
        }
    }
    
}
