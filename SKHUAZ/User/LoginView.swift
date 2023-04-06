import SwiftUI


struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var signup = false
    @StateObject var api = RestAPI.shared
    @Binding var loginSuccess: Bool // 화면 전환 시 사용
    @State private var error = false
    
    
    var body: some View {
        NavigationView{
            VStack{
                Image("SKHUAZ")
                    .resizable()
                    .frame(width: 250, height: 60)
                    .padding(.bottom)
                TextField("아이디를 입력해주세요", text: $email)
                    .padding()
                    .frame(width: 350, height: 50)
                    .background(Color(uiColor: .secondarySystemBackground))
                    .cornerRadius(10)
                    .autocapitalization(.none) // 자동으로 대문자 설정 안하기
                    .disableAutocorrection(true) // 자동완성 끄기
                SecureField("비밀번호를 입력해주세요", text: $password)
                    .padding()
                    .frame(width: 350, height: 50)
                    .background(Color(uiColor: .secondarySystemBackground))
                    .cornerRadius(10)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                NavigationLink(
                    destination: TabbarView(),
                    label: {
                        Text("로그인")
                            .frame(width: 330, height: 10)
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color(red: 0.603, green: 0.756, blue: 0.819))
                            .cornerRadius(10)
                        
                    })
                
                
                .padding(.top)
                Button(action: {
                                            // 이메일, 비밀번호 로그인 api 파라미터로 보내주기
                                            if email != "" && password != "" {
                                                let parameters: [String: Any] = ["email": email, "password": password]
                                                api.LoginSuccess(parameters: parameters) { value in

                                                    if value {
                                                        self.loginSuccess = true
                                                        print(self.loginSuccess,"여기 로그인 실행 이후 loginsuccess 값")
                                                    }
                                                    else {
                                                        self.error = true
                                                    }
                                                }
                                            }
                                            else {
                                                self.error = true
                                            }
                                        }) {
                                            Text("로그인")
                                                .frame(width: 100, height: 35)
                                                .fontWeight(.semibold)
                                                .font(.title3)
                                                .foregroundColor(.white)
                                                .background(RoundedRectangle(cornerRadius: 40).fill(Color.green))
                                        }
                HStack{
                    Spacer()
                    NavigationLink(
                        destination: SignUpView(),
                        label:{
                            Text("회원가입")
                                .font(.system(size: 10))
                                .foregroundColor(Color.gray)
                                .padding(.trailing)
                        })
//                    NavigationLink(destination: SignUpView().navigationBarTitle(Text("SKHUAZ"), displayMode: .inline)) {
//                        Text("회원가입")
//                            .font(.system(size: 10))
//                            .foregroundColor(Color.gray)
//                            .padding(.trailing)
//                    }
                    
                    
                }
                
            }
            // 로그인 실패 시 오류
                                if error {
                                    Text("아이디 또는 비밀번호 오류")
                                        .foregroundColor(Color.red)
                                }
        }
    }
    
    
    
}
