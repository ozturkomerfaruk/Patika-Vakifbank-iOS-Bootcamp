//
//  NetworkClient.swift
//  OnTheMap

import Foundation

class NetworkClient {
    
    struct Auth {
        static var sessionId = ""
        static var userId = ""
        static var firstName = ""
        static var lastName = ""
        static var key = ""
    }

    enum Endpoints {
        static let base = "https://onthemap-api.udacity.com/v1"

        case session
        case studentLocations
        case logout
        case postLocation
        case getUser(String)

        var stringValue: String {
            switch self {
            case .session:
                return Endpoints.base + "/session"
            case .studentLocations:
                return Endpoints.base + "/StudentLocation?limit=100&order=-updatedAt"
            case .logout:
                return Endpoints.base + "/session"
            case .postLocation:
                return Endpoints.base + "/StudentLocation"
            case .getUser(let userID):
                return Endpoints.base + "/users/\(userID)"
            }
        }

        var url: URL {
            return URL(string: stringValue)!
        }
    }

    class func taskForDELETERequest<ResponseType: Decodable>(url: URL, hasRange: Bool, responseType: ResponseType.Type, completion: @escaping (ResponseType?, Error?) -> Void) {
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        var xsrfCookie: HTTPCookie? = nil
        let sharedCookieStorage = HTTPCookieStorage.shared
        for cookie in sharedCookieStorage.cookies! {
          if cookie.name == "XSRF-TOKEN" { xsrfCookie = cookie }
        }
        if let xsrfCookie = xsrfCookie {
          request.setValue(xsrfCookie.value, forHTTPHeaderField: "X-XSRF-TOKEN")
        }
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
                return
            }
            //API case
            let range = 5..<data.count
            let newData = hasRange ? data.subdata(in: range) : data
            let decoder = JSONDecoder()
            do {
                let responseObject = try decoder.decode(ResponseType.self, from: newData)
                DispatchQueue.main.async {
                    completion(responseObject, nil)
                }
            } catch {
                do {
                    let errorResponse = try decoder.decode(BaseResponse.self, from: newData) as Error
                    DispatchQueue.main.async {
                        completion(nil, errorResponse)
                    }
                } catch {
                    DispatchQueue.main.async {
                        completion(nil, error)
                    }
                }
            }
        }
        task.resume()
    }

    class func taskForPOSTRequest<RequestType: Encodable, ResponseType: Decodable>(url: URL, hasRange: Bool, responseType: ResponseType.Type, body: RequestType, completion: @escaping (ResponseType?, Error?) -> Void) {
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = try! JSONEncoder().encode(body)
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
                return
            }
            //API case
            let range = 5..<data.count
            let newData = hasRange ? data.subdata(in: range) : data
            let decoder = JSONDecoder()
            do {
                let responseObject = try decoder.decode(ResponseType.self, from: newData)
                DispatchQueue.main.async {
                    completion(responseObject, nil)
                }
            } catch {
                do {
                    let errorResponse = try decoder.decode(BaseResponse.self, from: newData) as Error
                    DispatchQueue.main.async {
                        completion(nil, errorResponse)
                    }
                } catch {
                    DispatchQueue.main.async {
                        completion(nil, error)
                    }
                }
            }
        }
        task.resume()
    }

    @discardableResult
    class func taskForGETRequest<ResponseType: Decodable>(url: URL, hasRange: Bool = false, responseType: ResponseType.Type, completion: @escaping (ResponseType?, Error?) -> Void) -> URLSessionDataTask {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
                return
            }
            //API case
            let range = 5..<data.count
            let newData = hasRange ? data.subdata(in: range) : data
            let decoder = JSONDecoder()
            do {
                let responseObject = try decoder.decode(ResponseType.self, from: newData)
                DispatchQueue.main.async {
                    completion(responseObject, nil)
                }
            } catch {
                do {
                    let errorResponse = try decoder.decode(BaseResponse.self, from: newData) as Error
                    DispatchQueue.main.async {
                        completion(nil, errorResponse)
                    }
                } catch {
                    DispatchQueue.main.async {
                        completion(nil, error)
                    }
                }
            }
        }
        task.resume()

        return task
    }

    class func login(username: String, password: String, completion: @escaping (Bool, Error?) -> Void) {
        let body = LoginRequest(udacity: UdacityModel(username: username, password: password))
        taskForPOSTRequest(url: Endpoints.session.url, hasRange: true, responseType: LoginResponse.self, body: body) { response, error in
            if let response = response {
                Auth.sessionId = response.session.id
                Auth.userId = response.account.key
                completion(true, nil)
            } else {
                completion(false, error)
            }
        }
    }

    class func getStudentLocations(completion: @escaping ([StudentInformation], Error?) -> Void) {
        taskForGETRequest(url: Endpoints.studentLocations.url, responseType: StudentLocationResponse.self) { response, error in
            if let response = response {
                completion(response.results, nil)
            } else {
                completion([], error)
            }
        }
    }

    class func logout(completion: @escaping (Bool, Error?) -> Void) {
        taskForDELETERequest(url: Endpoints.logout.url, hasRange: true, responseType: LogoutResponse.self) { response, error in
            if let _ = response {
                Auth.sessionId = ""
                Auth.userId = ""
                completion(true, nil)
            } else {
                completion(false, error)
            }
        }
    }

    class func postLocation(location: StudentInformation, completion: @escaping (Bool, Error?) -> Void) {
        taskForPOSTRequest(url: Endpoints.postLocation.url, hasRange: false, responseType: PostLocationResponse.self, body: location) { response, error in
            if let _ = response?.objectId {
                completion(true, nil)
            } else {
                completion(false, error)
            }
        }
    }

    class func getCurrentUser(completion: @escaping (UserModel?, Error?) -> Void) {
        taskForGETRequest(url: Endpoints.getUser(Auth.userId).url, hasRange: true, responseType: UserModel.self) { response, error in
            if let response = response {
                Auth.firstName = response.firstName
                Auth.lastName = response.lastName
                Auth.key = response.key
                completion(response, nil)
            } else {
                completion(nil, error)
            }
        }
    }
}
