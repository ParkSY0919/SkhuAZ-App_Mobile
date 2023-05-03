//
//  Evaluation_Write.swift
//  SkhuAZ
//
//  Created by 박신영 on 2023/03/11.
//

import SwiftUI
import Foundation



struct Root_Write_noG: View {
    @State var title: String = ""
    @State var recommendation : String = ""
    @StateObject var api = RestAPI.shared
    @State var currentRouteInfo: String = "최근 진행한 선수과목제도가 표시됩니다."
    @State var isSaveButtonEnabled: Bool = true
    @State var department: String = "전공을 선택해주세요"
    @State var rootText: String = "최근 진행한 선수과목제도가 표시됩니다."
    @State private var skip: Bool = false
    @Environment(\.presentationMode) var presentationMode

    @EnvironmentObject var userData: UserData
    let baseURL = "http://skhuaz.duckdns.org/save/route"
    let departments = ["소프트웨어공학", "정보통신공학", "컴퓨터공학", "인공지능공학"]
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text("\(userData.nickname)")
                        .font(.system(size: 18))
                        .foregroundColor(Color(hex: 0x9AC1D1))
                        
                    Text("님은 지금 2023-1 학기 입니다.")
                        .font(.system(size: 18))
                }.padding(.top, 20)
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(hex: 0x9AC1D1), lineWidth: 2)
                    .frame(width: 370, height: 450)
                    .padding(5)
                    .overlay(content: {
                        VStack(content: {
                            TextField("제목을 작성해주세요 (최대 45자)", text: $title)
                                .padding(.leading)
                                .frame(width: 350, height: 40)
                                .background(Color(hex: 0xEFEFEF))
                                .cornerRadius(10)
                            
                            HStack {
                                Rectangle()
                                    .fill(Color(hex: 0xEFEFEF))
                                    .frame(width: 350, height: 40)
                                    .cornerRadius(10)
                                    .overlay(content: {
                                        HStack {
                                            Menu(department) {
                                                ForEach(departments, id: \.self) { dept in
                                                    Button(dept, action: { department = dept })
                                                }
                                            }
                                            Spacer()
                                            .foregroundColor(Color(hex: 0xEFEFEF))
                                                .padding()
                                                .frame(width: 10, height: 50)
                                                .cornerRadius(10)
                                        }
                                    })
                                    }
                           
                            Button(action: {
                                // "루트 가져오기" 버튼이 클릭되면 실행되는 코드입니다.
                                api.getRouteInfo { result in
                                    switch result {
                                    case .success(let routeInfo):
                                        DispatchQueue.main.async {
                                            // 받아온 루트 정보를 이용하여 UI 업데이트
                                            self.currentRouteInfo = routeInfo
                                            // "루트 저장" 버튼 활성화
                                            self.isSaveButtonEnabled = true
                                            // TODO: 추가적인 UI 업데이트 코드 작성
                                        }
                                    case .failure(let error):
                                        // API 서버와 통신 중 오류가 발생한 경우 처리합니다.
                                        print("Failed to get route information: \(error.localizedDescription)")
                                    }
                                }
                                

                            },label: {
                                // 버튼 모양과 텍스트를 설정합니다.
                                Text("루트 가져오기")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 15))
                            })
                            .frame(width: 350, height: 40)
                            .background(Rectangle().fill(Color(hex: 0x4F4F4F)))
                            .cornerRadius(10)
                            
                            
                            Rectangle()
                                .fill(Color(hex: 0xEFEFEF))
                                .frame(width: 350, height: 60)
                                .cornerRadius(10)
                                .overlay(content: {
                                    HStack {
                                        Text("\(currentRouteInfo)").font(.system(size: 15))
                                        
                                    }
                                })

                            
                            TextField("루트추천 설명을 작성해주세요 (최대 100자)", text: $recommendation)
                                .padding(.leading, 10)
                                .padding(.bottom, 120)
                                .frame(width: 350, height: 160)
                                .background(Color(hex: 0xEFEFEF))
                                .cornerRadius(10)
                            
                            
                            
                            
                        })
                    })
                
            }
            Button(action: {
                saveData()
                
                self.presentationMode.wrappedValue.dismiss()
            }, label: {
                Rectangle().fill(Color(hex: 0x9AC1D1))
                    .frame(width: 350, height: 40)
                    .cornerRadius(10)
                    .overlay(content: {
                        HStack {
                            Text("저장")
                                .foregroundColor(Color.white)
                                .font(.system(size: 15))
                        }
                    })
            })

            
//            //취소 버튼
//            Button(action: {
//                 print("취소버튼 클릭")
//                skip = true
//                })
//            {
//                Rectangle().fill(Color(hex: 0xEFEFEF))
//                    .frame(width: 350, height: 40)
//                    .cornerRadius(10)
//                    .overlay(content: {
//                        HStack {
//                            Text("목록으로")
//                                .foregroundColor(Color.black)
//                                .font(.system(size: 15))
//                        }
//                    })
//            }
//            .background(
//                NavigationLink(destination: RootView(), isActive: $skip) {
//                    
//                    EmptyView()
//                }
//            )
            
            Spacer()
        }
    }
    func saveData() {
          let sessionId = userData.sessionId
          // HTTP Request 생성
          let url = URL(string: baseURL)!
          var request = URLRequest(url: url)
          request.httpMethod = "POST"

          // 세션 ID를 헤더에 추가
          request.addValue(sessionId, forHTTPHeaderField: "sessionId")

          // POST Body에 데이터 추가
          let body: [String: Any] = [
              "title": title,
              "department": department,
              "recommendation": recommendation
          ]
          // JSON 형태로 요청의 미디어 타입 설정
          request.addValue("application/json", forHTTPHeaderField: "Content-Type")
          request.httpBody = try? JSONSerialization.data(withJSONObject: body)

          // URLSession을 사용하여 데이터 전송
          URLSession.shared.dataTask(with: request) { data, response, error in
              if let data = data {
                  // 서버로부터의 응답 데이터 처리
                  print("Response data: \(String(data: data, encoding: .utf8) ?? "")")
              }
              if let error = error {
                  // 에러 처리
                  print("Error: \(error.localizedDescription)")
              }
          }.resume()
      }
}
