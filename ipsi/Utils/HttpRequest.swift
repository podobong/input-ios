import SwiftUI


func createParamString(params: [String: String]) -> String {
    var paramString: String = ""
    var index: Int = 0
    for (key, value) in params {
        paramString += "\(key)=\(value)"
        if index != params.count - 1 {
            paramString += "&"
        }
        index += 1
    }
    return paramString
}

func get(url: String, params: [String: String] = [:], function: @escaping (Data, HTTPURLResponse) -> Void) {
    let urlObject = URL(string: "\(url)?\(createParamString(params: params))")!
    var request = URLRequest(url: urlObject)
    request.httpMethod = "GET"
    URLSession.shared.dataTask(with: request) { (data, response, error) in
        if error != nil {
            print(error!)
            return
        }
        if let httpResponse = response as? HTTPURLResponse {
            function(data!, httpResponse)
        }
    }.resume()
}

func post(url: String, params: [String: String] = [:], function: @escaping (Data, HTTPURLResponse) -> Void) {
    let urlObject: URL = URL(string: url)!
    let body = createParamString(params: params).data(using: .utf8, allowLossyConversion: false)
    var request = URLRequest(url: urlObject)
    request.httpMethod = "POST"
    request.httpBody = body
    URLSession.shared.dataTask(with: request) { (data, response, error) in
        if error != nil {
            print(error!)
            return
        }
        if let httpResponse = response as? HTTPURLResponse {
            function(data!, httpResponse)
        }
    }.resume()
}
