//
//  File.swift
//  
//
//  Created by Rostislav Maslov on 23.02.2022.
//

import Foundation


class RequestService {
    
   
    
    internal func dateFormatter() -> DateFormatter{
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
        return formatter
    }
    

    func  requestJson<R:Encodable, T:Codable>(
        url:String,
        method: String,
        requestBody: R,
        responseFunc: @escaping ApiResponseProtocol<T, String>,
        stopRequesting: Bool = true) {
            // prepare json data
            let encoder = JSONEncoder()
            encoder.dateEncodingStrategy = .formatted(dateFormatter())
            
            let jsonData:Data? = try? encoder.encode(requestBody)
            
            // create post request
            let urlObj = URL(string: url)!
            var request = URLRequest(url: urlObj)
            request.httpMethod = method
            
            // insert json data to the request
            if (requestBody is EmptyRequest) == false && jsonData != nil {
                request.httpBody = jsonData
            }
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            
           
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data, error == nil else {
                    print(error?.localizedDescription ?? "No data")
                    responseFunc(nil, "", false)
                    return
                }
                
                var status: Bool = false
                var code: Int = -1
                
                if let httpResponse = response as? HTTPURLResponse {
                    if ( httpResponse.statusCode == 200 || httpResponse.statusCode == 201) {
                        status = true
                    }
                    code = httpResponse.statusCode
                }
                
               
                
                print("===========================")
                print("\(request.httpMethod ?? "") \(String(describing: request.url))")
                print("HEADERS \n \(String(describing: request.allHTTPHeaderFields))")
                var str = ""
                if request.httpBody != nil {
                    str = String(decoding: request.httpBody!, as: UTF8.self)
                }
                print("BODY \n \(str)")
                print("----------------------------")
                print("CODE \n \(code)")
                
                do {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .formatted(self.dateFormatter())
                    
                    let responseObj = try decoder.decode(T.self, from: data)
                    
                    print("responseObj \n \(responseObj)\n")
                    print("errorObj \n")
                    print("===========================")
                    
                    responseFunc(responseObj, nil, status)
                } catch let err{
                    let errorObj = String(decoding: data, as: UTF8.self)
                                        
                    print("errorObj \n \(errorObj)")
                    print("error \n \(err)")
                    print("===========================")
                    
                    responseFunc(nil, errorObj, false)
                }
                
            }
            
            task.resume()
        }
    

    func  requestFormUrl<T:Codable>(
        url:String,
        method: String,
        responseFunc: @escaping ApiResponseProtocol<T, String>,
        stopRequesting: Bool = true) {
            // prepare json data
            //let jsonData = try? JSONEncoder().encode(request)
            // create post request
            let urlObj = URL(string: url)!
            var request = URLRequest(url: urlObj)
            request.httpMethod = method
            
            // insert json data to the request
            //request.httpBody = jsonData
            //request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            //request.addValue("application/json", forHTTPHeaderField: "Accept")
            //let token: String? = DefaultStore.store.token.getAccessToken()
            
          
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data, error == nil else {
                    print(error?.localizedDescription ?? "No data")
                    responseFunc(nil, "", false)
                    return
                }
                
                var status: Bool = false
                var code: Int = -1
                
                if let httpResponse = response as? HTTPURLResponse {
                    if ( httpResponse.statusCode == 200 || httpResponse.statusCode == 201) {
                        status = true
                    }
                    code = httpResponse.statusCode
                }
                
              
                
                print("===========================")
                print("\(request.httpMethod ?? "") \(String(describing: request.url))")
                print("HEADERS \n \(String(describing: request.allHTTPHeaderFields))")
                var str = ""
                if request.httpBody != nil {
                    str = String(decoding: request.httpBody!, as: UTF8.self)
                }
                print("BODY \n \(str)")
                print("----------------------------")
                print("CODE \n \(code)")
                
                do {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .formatted(self.dateFormatter())
                    
                    let responseObj = try decoder.decode(T.self, from: data)
                    
                    print("responseObj \n \(responseObj)\n")
                    print("errorObj \n")
                    print("===========================")
                    
                    responseFunc(responseObj, nil, status)
                } catch let err{
                    let errorObj = String(decoding: data, as: UTF8.self)
                    
                    print("errorObj \n \(errorObj)")
                    print("error \n \(err)")
                    print("===========================")
                    
                    responseFunc(nil, errorObj, false)
                }
                
                
               
            }
            
            task.resume()
        }
    
}

