import Foundation
import Combine
import Alamofire
import SwiftyJSON

struct SignUp: Hashable, Codable {
    
    let email: String
    let password: String
    let nickname: String
    let graduate: Bool
    let magor1: String
    let magor2: String
    let department: Bool
    let major_minor: Bool
    let double_major: Bool
    let Semester: String
}


struct Login: Hashable, Decodable {
    let double_major: Bool
    let sessionId: String
    let login: Bool
    let message: String
    let major_minor: Bool
    let major2: String
    let major1: String
    let password: String
    let graduate: Bool
    let nickname: String
    let department: Bool
    let email: String
    let Semester: String
}


class RestAPI: ObservableObject {
    static let shared = RestAPI()
    @Published var signup: [SignUp] = []
    @Published var login: [Login] = []
    @Published var date: String = "" //날짜
    @Published var materialResponse: String = ""
    
    //23.04.08 추가
    @Published var posts: [Login] = []
    static var LogineSuccess: Bool = false
    
    
    
    
    
    //MARK: 회원가입
    func Signup(parameters: [String: Any]) {
        guard let url = URL(string:
                                "http://skhuaz.duckdns.org/users/new-user") else {
            return
        }
        
        let data = try! JSONSerialization.data(withJSONObject: parameters)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let posts = try String(data: data, encoding: .utf8)!
                DispatchQueue.main.async {
                    print(posts)
                }
            }
            catch {
                print(error)
            }
        }
        task.resume()
    }
    
    
    
    //MARK: 로그인
    func LoginSuccess(parameters: [String: Any], userData: UserData, completion: @escaping (Bool) -> ()) {
        // 로그인 API 호출
        let url = "http://skhuaz.duckdns.org/users/login"
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            switch response.result {
                
            case .success(let value):
                RestAPI.LogineSuccess = true
                let json = JSON(value)
                print("userData 가공전 json : \(json)")
                if json != "" {
                    // 로그인 성공
                    userData.double_major = json["double_major"].boolValue
                    userData.sessionId = json["sessionId"].stringValue
                    userData.major_minor = json["major_minor"].boolValue
                    userData.major2 = json["major2"].stringValue
                    userData.major1 = json["major1"].stringValue
                    userData.password = json["password"].stringValue
                    userData.graduate = json["graduate"].boolValue
                    userData.nickname = json["nickname"].stringValue
                    userData.department = json["department"].boolValue
                    userData.email = json["email"].stringValue
                    userData.semester = json["semester"].stringValue
                    

                    completion(true)
                    
                } else {
                    // 로그인 실패
                    completion(false)
                }
            case .failure(let error):
                print("로그인 실패 에러코드 : ",error)
                print(response.result)
                
                completion(false)
            }
        }
    }
    
    /**로그아웃**/
    func logout(completion: @escaping (Bool) -> Void) {
                guard let url = URL(string: "http://skhuaz.duckdns.org/user/logout") else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.setValue("sessionId=\(RestAPI.sessionId)", forHTTPHeaderField: "Cookie") // 쿠키 설정

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                if let error = error {
                        print("Error: \(error.localizedDescription)")
                    } else {
                        print("HTTP status code: \((response as? HTTPURLResponse)?.statusCode ?? -1)")
                    }
                    completion(false)
                    return
            }
            print("HTTP status code: \((response as? HTTPURLResponse)?.statusCode ?? -1)")
            // 세션 아이디 삭제
            let cookieStorage = HTTPCookieStorage.shared
            if let cookies = cookieStorage.cookies(for: url) {
                for cookie in cookies {
                    cookieStorage.deleteCookie(cookie)
                }
            }
            
            completion(true)

        }
        task.resume()
    }

    //    func LoginSuccess(parameters: [String: Any], completion: @escaping (Bool) -> ()) {
    //
    //        guard let url = URL(string:
    //                                "http://skhuaz.duckdns.org/users/login") else {
    //            return
    //        }
    //
    //
    //        let data = try! JSONSerialization.data(withJSONObject: parameters)
    //
    //
    //        var request = URLRequest(url: url)
    //        request.httpMethod = "POST"
    //        request.httpBody = data
    //        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    //
    //        //로그인했을 때 userid에 email 값을 저장해둠
    //        //추후 로그아웃 했을 때에 꼭 초기화 해줘야함.
    //
    //        RestAPI.UserEmail = parameters["email"]!
    //        print("로그인 된 User Email 값 : \(RestAPI.UserEmail)")
    //        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
    //            guard let data = data, error == nil else {
    //                return
    //
    //            }
    //
    //            do {
    //                let posts = try JSONDecoder().decode(Login.self, from: data)
    //                DispatchQueue.main.async { [self] in
    //                    self?.posts = [posts]
    //                }
    //                print("Login 끝나고 난 후 posts[Login] 값의 타입 : \(type(of:posts))") //로그인 구조체 타입.
    //                print(posts)
    //            }
    //            catch {
    //                print(error)
    //            }
    //            do {
    //                let login = try JSONDecoder().decode(Login.self, from: data)
    //                // 변환된 Login 객체를 사용해 필요한 작업을 수행합니다.
    //            } catch {
    //                print("Error: \(error.localizedDescription)")
    //            }
    //        }
    //        task.resume()
    //    }
    //    func logout(completion: @escaping (Bool) -> Void) {
    //        guard let url = URL(string: "http://skhuaz.duckdns.org/users/logout") else {
    //            return
    //        }
    //        var request = URLRequest(url: url)
    //        request.httpMethod = "POST"
    //        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    //        request.setValue(RestAPI.sessionId as! String, forHTTPHeaderField: "sessionId") // 세션 아이디 설정
    //
    //        let task = URLSession.shared.dataTask(with: request) { data, response, error in
    //            guard let data = data, error == nil else {
    //                completion(false)
    //                return
    //            }
    //            do {
    //                let result = try JSONDecoder().decode(LogoutResult.self, from: data)
    //                if result.status == "success" {
    //                    RestAPI.userid = "" // userid 초기화
    //                    RestAPI.sessionId = "" // 세션 아이디 초기화
    //                    completion(true)
    //                } else {
    //                    completion(false)
    //                }
    //            } catch {
    //                completion(false)
    //            }
    //        }
    //        task.resume()
    //    }
}


class UserData: ObservableObject {
    @Published var double_major: Bool = false
    @Published var sessionId: String = ""
    @Published var major_minor: Bool = false
    @Published var major2: String? = nil
    @Published var major1: String? = nil
    @Published var password: String = ""
    @Published var graduate: Bool = false
    @Published var nickname: String = ""
    @Published var semester: String = ""
    @Published var department: Bool = false
    @Published var email: String = ""
    
    func setData(from response: UserData) {
        double_major = response.double_major
        sessionId = response.sessionId
        major_minor = response.major_minor
        major2 = response.major2
        major1 = response.major1
        password = response.password
        graduate = response.graduate
        nickname = response.nickname
        department = response.department
        email = response.email
        semester = response.semester
    }
}

