//
//  RestAPI.swift
//  SKHUAZ
//
//  Created by 박신영 on 2023/04/02.
//

import Foundation
import Combine

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
}

struct Login: Hashable, Codable {
    // 로그인 성공 시 반환되는 값x
}


class RestAPI: ObservableObject {
    static let shared = RestAPI()
        @Published var signup: [SignUp] = []
        @Published var login: [Login] = []
        @Published var loginsuccess: Bool = false
        @Published var date: String = "" //날짜
//        @Published var posts: [Barcode] = []
        @Published var materialResponse: String = ""
        static var userid: Any = ""
    //static var userid: Any = "" 이렇게 사용시 함수에서 값을 바꿔도 이 전역변수에 적용됨
    
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
    func LoginSuccess(parameters: [String: Any],completion: @escaping (Bool) -> Void) {
        
        guard let url = URL(string:
                                "http://skhuaz.duckdns.org/users/login") else {
            return
        }
        
        
        let data = try! JSONSerialization.data(withJSONObject: parameters)
        
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        //로그인했을 때 userid에 email 값을 저장해둠
        //추후 로그아웃 했을 때에 꼭 초기화 해줘야함.
        RestAPI.userid = parameters["email"]!
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
                
            }
            
            do {
                let posts = try String(data: data, encoding: .utf8)!
//                let posts = try JSONDecoder().decode(Login.self, from: data)
                DispatchQueue.main.async {
                    completion(true)
                    print("여기는 let posts 파트",posts)
                }
            }
            catch {
                print(error)
            }
        }
        task.resume()
    }
}
