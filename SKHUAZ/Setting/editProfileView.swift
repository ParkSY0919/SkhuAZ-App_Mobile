//
//  editProfileView.swift
//  pbch
//
//  Created by 문인호 on 2023/03/13.
//

import SwiftUI
struct editProfileView: View {
    @State private var Name: String = "" // 이름
    @State private var Nickname: String = "" // 닉네임
    @State private var Semester: Int = 0 // 학기
    
    
    @State private var Graduate: Bool = false // 졸업여부
    @State private var Department: Bool = false // 전공미선택
    @State private var Major_minor: Bool = false // 주/부전공
    @State private var Double_major: Bool = false // 복수전공
    @State private var Major1: String = "IT융합자율학부" // 전공 1
    @State private var Major2: String = "전공2" // 전공 2
    
    var body: some View {
        Group{
            VStack(){
                TextInput(
                    Name: self.$Name,
                    Nickname: self.$Nickname,
                    Semester: self.$Semester,
                    //                )
                    
                    //                SelectView(
                    Graduate: self.$Graduate,
                    Department: self.$Department,
                    Major_minor: self.$Major_minor,
                    Double_major: self.$Double_major,
                    Major1: self.$Major1,
                    Major2: self.$Major2
                )
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
struct editProfileView_Previews: PreviewProvider {
    static var previews: some View {
        editProfileView()
    }
}

struct TextInput: View {
    @Binding var Name: String
    @Binding var Nickname: String
    @Binding var Semester: Int
    
    @State var SemesterMessage: String = "재학중인 학기를 선택하시오"
    @State var ShowModel: Bool = false
    @State var certification: Bool = false
    
    
    let SelectedMajor1 = [
        "소프트웨어공학",
        "정보통신공학",
        "컴퓨터공학",
        "인공지능"
    ]
    let SelectedMajor2 = [
        "소프트웨어공학",
        "정보통신공학",
        "컴퓨터공학",
        "인공지능"
    ]
    
    @Binding var Graduate: Bool
    @Binding var Department: Bool
    @Binding var Major_minor: Bool
    @Binding var Double_major: Bool
    @Binding var Major1: String
    @Binding var Major2: String
    @State var MarjorError: String = "선택한 두 전공이 같습니다"
    
    struct SecondSignView: View{ // 학기 선택 부터 뷰
        var body: some View{
            Text("")
        }
    }
    
    var body: some View {
            VStack{
                ZStack{
                    Circle()
                        .fill(Color(hex: 0xEFEFEF))
                        .frame(width: 150, height: 150)
                    Text("프로필 사진")
                        .foregroundColor(Color(hex: 0x7D7D7D))
                }
                .padding(.bottom, 15)
                TextField("이름을 입력해주세요* ", text: $Name)
                    .padding()
                    .frame(width: 350, height: 50)
                    .background(Color(uiColor: .secondarySystemBackground))
                    .cornerRadius(10)
                HStack{
                    TextField("닉네임을 입력해주세요* ", text: $Nickname)
                        .padding()
                        .frame(width: 250, height: 50)
                        .background(Color(uiColor: .secondarySystemBackground))
                        .cornerRadius(10)
                    Button{} label: {
                        Text("중복확인")
                            .foregroundColor(Color(red: 0.76, green: 0.552, blue: 0.552))
                            .frame(width: 90, height:50)
                            .background(RoundedRectangle(cornerRadius: 10).strokeBorder(Color(red: 0.76, green: 0.552, blue: 0.552)))
                    }
                } // 닉네임 입력 HStack
                .padding(30)
            }
            HStack(spacing: 30){
                Text("학기 입력 * ")
                    .font(.system(size: 14))
                Group{
                    Menu {
                        Section(header: Text("재학중인 학기를 선택하시오")) {
                            Button(action: {
                                Semester = 8
                                SemesterMessage = "4학년 2학기"
                            }) {
                                Label("4학년 2학기", systemImage: "")
                            }
                            Button(action: {
                                Semester = 7
                                SemesterMessage = "4학년 1학기"
                            }) {
                                Label("4학년 1학기", systemImage: "")
                            }
                            Button(action: {
                                Semester = 6
                                SemesterMessage = "3학년 2학기"
                            }) {
                                Label("3학년 2학기", systemImage: "")
                            }
                            Button(action: {
                                Semester = 5
                                SemesterMessage = "3학년 1학기"
                            }) {
                                Label("3학년 1학기", systemImage: "")
                            }
                            Button(action: {
                                Semester = 4
                                SemesterMessage = "2학년 2학기"
                            }) {
                                Label("2학년 2학기", systemImage: "")
                            }
                            Button(action: {
                                Semester = 3
                                SemesterMessage = "2학년 1학기"
                            }) {
                                Label("2학년 1학기", systemImage: "")
                            }
                            Button(action: {
                                Semester = 2
                                SemesterMessage = "1학년 2학기"
                            }) {
                                Label("1학년 2학기", systemImage: "")
                            }
                            Button(action: {
                                Semester = 1
                                SemesterMessage = "1학년 1학기"
                            }) {
                                Label("1학년 1학기", systemImage: "")
                            }
                        }
                    }
                label: {
                    Label("\(SemesterMessage)", systemImage: "")
                        .foregroundColor(Color(.gray))
                        .accentColor(.gray)
                        .padding()
                        .frame(width: 250, height: 50)
                        .background(Color(uiColor: .secondarySystemBackground))
                        .cornerRadius(10)
                }
                }
            }
            .padding(.bottom, 30)
            
            VStack(spacing: 1){ // 졸업유무 전공유형 스텍
                HStack(spacing: 30){
                    Text("졸업유무 *")
                        .font(.system(size: 14))
                    HStack(spacing: 30){
                        Button(action: {
                            Graduate.toggle()
                        }) {
                            if Graduate {
                                ZStack{
                                    Circle()
                                        .fill(Color(red: 0.603, green: 0.756, blue: 0.819))
                                        .frame(width: 15, height: 15)
                                    Circle()
                                        .fill(Color.white)
                                        .frame(width: 6, height: 6)
                                }
                                Text("미졸업")
                            }
                            else {
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: 15, height: 15)
                                    .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                                Text("미졸업")
                            }
                        }
                        .font(.system(size: 12))
                        .foregroundColor(.black)
                        
                        Button(action: {
                            Graduate.toggle()
                        }) {
                            if !Graduate {
                                ZStack{
                                    Circle()
                                        .fill(Color(red: 0.603, green: 0.756, blue: 0.819))
                                        .frame(width: 15, height: 15)
                                    Circle()
                                        .fill(Color.white)
                                        .frame(width: 6, height: 6)
                                }
                                Text("졸업")
                            }
                            else {
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: 15, height: 15)
                                    .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                                Text("졸업")
                            }
                        }
                        .font(.system(size: 12))
                        .foregroundColor(.black)
                        Spacer()
                    }
                    .frame(width: 250, height: 50)
                }
                .padding(.bottom, 30)
                
                HStack(spacing: 30){
                    Text("전공유형*")
                        .font(.system(size: 14))
                    HStack(spacing: 20){
                        Button(action: {
                            Department = true
                            Major_minor = false
                            Double_major = false
                            Major1 = "IT융합자율학부"
                            Major2 = ""
                        }) {
                            if Department {
                                ZStack{
                                    Circle()
                                        .fill(Color(red: 0.603, green: 0.756, blue: 0.819))
                                        .frame(width: 15, height: 15)
                                    Circle()
                                        .fill(Color.white)
                                        .frame(width: 6, height: 6)
                                }
                                Text("전공 미선택")
                                    .foregroundColor(.black)
                                
                            }
                            else {
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: 15, height: 15)
                                    .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                                Text("전공 미선택")
                                    .foregroundColor(.black)
                            }
                        }
                        .aspectRatio(contentMode: .fill)
                        Button(action: {
                            Department = false
                            Major_minor = true
                            Double_major = false
                            Major1 = "주전공"
                            Major2 = "부전공"
                        }) {
                            if Major_minor {
                                ZStack{
                                    Circle()
                                        .fill(Color(red: 0.603, green: 0.756, blue: 0.819))
                                        .frame(width: 15, height: 15)
                                    Circle()
                                        .fill(Color.white)
                                        .frame(width: 6, height: 6)
                                }
                                Text("주/부전공")
                                    .foregroundColor(.black)
                                
                            }
                            else {
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: 15, height: 15)
                                    .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                                Text("주/부전공")
                                    .foregroundColor(.black)
                            }
                        }
                        .aspectRatio(contentMode: .fill)
                        Button(action: {
                            Department = false
                            Major_minor = false
                            Double_major = true
                            Major1 = "전공1"
                            Major2 = "전공2"
                        }) {
                            if Double_major {
                                ZStack{
                                    Circle()
                                        .fill(Color(red: 0.603, green: 0.756, blue: 0.819))
                                        .frame(width: 15, height: 15)
                                    Circle()
                                        .fill(Color.white)
                                        .frame(width: 6, height: 6)
                                }
                                Text("복수전공")
                                    .foregroundColor(.black)
                                
                            }
                            else {
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: 15, height: 15)
                                    .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                                Text("복수전공")
                                    .foregroundColor(.black)
                            }
                        }
                        .aspectRatio(contentMode: .fill)
                    }
                    .font(.system(size: 12))
                    .foregroundColor(.black)
                    .frame(width: 250, height: 50)
                } // 졸업유무 전공유형 스택
                VStack(spacing: 1){
                    
                    HStack(spacing: 10){
                        if Department {
                            Text("\(Major1)")
                                .foregroundColor(.gray)
                                .padding()
                                .frame(width: 350, height: 50)
                                .background(Color(uiColor: .secondarySystemBackground))
                                .cornerRadius(10)
                        }
                        else if Major_minor {
                            HStack{
                                Menu("\(Major1)") {
                                    Button("소프트웨어공학",
                                           action: { Major1 = "소프트웨어공학"}
                                    )
                                    Button("정보통신공학",
                                           action: { Major1 = "정보통신공학"})
                                    Button("컴퓨터공학",
                                           action: { Major1 = "컴퓨터공학"})
                                    Button("인공지능",
                                           action: { Major1 = "인공지능"})
                                }
                                .foregroundColor(.gray)
                                .padding()
                                .frame(width: 170, height: 50)
                                .background(Color(uiColor: .secondarySystemBackground))
                                .cornerRadius(10)
                                
                                Menu("\(Major2)") {
                                    Button("소프트웨어공학",
                                           action: { Major2 = "소프트웨어공학"})
                                    Button("정보통신공학",
                                           action: { Major2 = "정보통신공학"})
                                    Button("컴퓨터공학",
                                           action: { Major2 = "컴퓨터공학"})
                                    Button("인공지능",
                                           action: { Major2 = "인공지능"})
                                }
                                .foregroundColor(.gray)
                                .padding()
                                .frame(width: 170, height: 50)
                                .background(Color(uiColor: .secondarySystemBackground))
                                .cornerRadius(10)
                            }
                        }
                        else if Double_major{
                            HStack{
                                Menu("\(Major1)") {
                                    Button("소프트웨어공학",
                                           action: { Major1 = "소프트웨어공학"})
                                    Button("정보통신공학",
                                           action: { Major1 = "정보통신공학"})
                                    Button("컴퓨터공학",
                                           action: { Major1 = "컴퓨터공학"})
                                    Button("인공지능",
                                           action: { Major1 = "인공지능"})
                                }
                                .foregroundColor(.gray)
                                .padding()
                                .frame(width: 170, height: 50)
                                .background(Color(uiColor: .secondarySystemBackground))
                                .cornerRadius(10)
                                
                                Menu("\(Major2)") {
                                    Button("소프트웨어공학",
                                           action: { Major2 = "소프트웨어공학"})
                                    Button("정보통신공학",
                                           action: { Major2 = "정보통신공학"})
                                    Button("컴퓨터공학",
                                           action: { Major2 = "컴퓨터공학"})
                                    Button("인공지능",
                                           action: { Major2 = "인공지능"})
                                }
                                .foregroundColor(.gray)
                                .padding()
                                .frame(width: 170, height: 50)
                                .background(Color(uiColor: .secondarySystemBackground))
                                .cornerRadius(10)
                            }
                        }
                    }
                    .frame(width: 350, height: 50)
                    HStack{ // 비밀번호 안내문구 출력
                        if Major1 == Major2{
                            Text(MarjorError)
                                .font(.system(size: 14))
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            .padding(.bottom, 30)
            Text("저장")
                .frame(width: 330, height: 10)
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .background(Color(red: 0.603, green: 0.756, blue: 0.819))
                .cornerRadius(10)
        Text("")
        }//VStack 종료 부분
}
