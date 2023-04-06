import SwiftUI

struct SignupView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var nickname = ""
    @State private var graduate = false
    @State private var major1 = ""
    @State private var major2 = ""
    @State private var department = false
    @State private var major_minor = false
    @State private var double_major = false
    @State private var errorMessage = ""
    
    var body: some View {
        VStack {
            TextField("이메일", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            SecureField("비밀번호", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("닉네임", text: $nickname)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Toggle(isOn: $graduate) {
                Text("졸업생")
            }
            TextField("전공1", text: $major1)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("전공2", text: $major2)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Toggle(isOn: $department) {
                Text("부/단과대")
            }
            Toggle(isOn: $major_minor) {
                Text("부전공")
            }
            Toggle(isOn: $double_major) {
                Text("복수전공")
            }
            Button(action: signup) {
                Text("회원가입")
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            
            //            if !errorMessage.isEmpty {
            //                Text(errorMessage)
            //                    .padding(.top, 10)
            //            }
        }
    }
    
    private func signup() {
        let parameters: [String: Any] = ["email": email, "password": password, "nickname": nickname, "graduate": graduate, "major1": major1, "major2": major2, "department": department, "major_minor": major_minor, "double_major": double_major]
        
        guard let url = URL(string: "http://skhuaz.duckdns.org/users/new-user") else {
            self.errorMessage = "서버 URL이 잘못되었습니다."
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {
            self.errorMessage = "서버 요청 생성에 실패했습니다."
            return
        }
        request.httpBody = httpBody
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                self.errorMessage = "서버 응답에 실패했습니다."
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                self.errorMessage = "서버 응답이 올바르지 않습니다."
                return
            }
            
            DispatchQueue.main.async {
                if let result = String(data: data, encoding: .utf8) {
                    if result == "Join success" {
                        self.errorMessage = "회원가입에 성공했습니다."
                    } else {
                        self.errorMessage = "회원가입에 실패했습니다."
                    }
                }
            }
        }
        task.resume()
    }
}
