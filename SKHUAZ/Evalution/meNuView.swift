//
//  meNuView.swift
//  skhuaz
//
//  Created by 봉주헌 on 2023/03/11.
//

import SwiftUI

struct meNuView : View {
    @State private var Subject_name: String = "과목명"
    @State private var professor_name: String = "교수님"
    @State private var leason_year: String = "수강년도"
    @State private var cl_major: String = "전공구분"
    @State private var Semester: String = "학기"
    @State private var teample: String = "선택"
    
    @State private var allreview: String = ""
    
    var body: some View {
        VStack{
            Rectangle().fill(Color(hex: 0xEFEFEF))
                .frame(width: 350, height: 40)
                .cornerRadius(10)
                .overlay(content: {
                    HStack {
                        Menu("\(Subject_name)") {
                            Button("데이터베이스",
                                   action: { Subject_name = "데이터베이스"})
                            Button("자바프로그래밍",
                                   action: { Subject_name = "자바프로그래밍"})
                            Button("웹개발 입문",
                                   action: { Subject_name = "웹개발 입문"})
                            
                        }
                        .foregroundColor(Color(hex: 0x4F4F4F))
                        Spacer()
                            .padding()
                            .frame(width: 10, height: 50)
                            .cornerRadius(10)
                    }
                })
            Rectangle().fill(Color(hex: 0xEFEFEF))
                .frame(width: 350, height: 40)
                .cornerRadius(10)
                .overlay(content: {
                    HStack {
                        Menu("\(professor_name)") {
                            Button("홍은지",
                                   action: { professor_name = "홍은지"})
                            Button("이승진",
                                   action: { professor_name = "이승진"})
                            Button("문성현",
                                   action: { professor_name = "문성현"})
                            
                        }
                        .foregroundColor(Color(hex: 0x4F4F4F))
                        Spacer()
                            .padding()
                            .frame(width: 10, height: 50)
                            .cornerRadius(10)
                    }
                })
            HStack{
                Rectangle().fill(Color(hex: 0xEFEFEF))
                    .frame(width: 170, height: 40)
                    .cornerRadius(10)
                    .overlay(content: {
                        HStack {
                            Menu("\(leason_year)") {
                                Button("2018년",
                                       action: { leason_year = "2018년"})
                                Button("2019년",
                                       action: { leason_year = "2019년"})
                                Button("2020년",
                                       action: { leason_year = "2020년"})
                                Button("2021년",
                                       action: { leason_year = "2021년"})
                                
                            }
                            .foregroundColor(Color(hex: 0x4F4F4F))
                            Spacer()
                                .padding()
                                .frame(width: 10, height: 50)
                                .cornerRadius(10)
                        }
                    })
                Rectangle().fill(Color(hex: 0xEFEFEF))
                    .frame(width: 170, height: 40)
                    .cornerRadius(10)
                    .overlay(content: {
                        HStack {
                            Menu("\(Semester)") {
                                Button("1 - 1",
                                       action: { Semester = "1 - 1"})
                                Button("1 - 2",
                                       action: { Semester = "1 - 2"})
                                Button("2 - 1",
                                       action: { Semester = "2 - 1"})
                                Button("2 - 2",
                                       action: { Semester = "2 - 2"})
                                Button("3 - 1",
                                       action: { Semester = "3 - 1"})
                                Button("3 - 2",
                                       action: { Semester = "3 - 2"})
                                Button("4 - 1",
                                       action: { Semester = "4 - 1"})
                                Button("4 - 2",
                                       action: { Semester = "4 - 2"})
                                Button("5 - 1",
                                       action: { Semester = "5 - 1"})
                                
                            }
                            .foregroundColor(Color(hex: 0x4F4F4F))
                            Spacer()
                                .padding()
                                .frame(width: 10, height: 50)
                                .cornerRadius(10)
                        }
                    })
            }
            Rectangle().fill(Color(hex: 0xEFEFEF))
                .frame(width: 350, height: 40)
                .cornerRadius(10)
                .overlay(content: {
                    HStack {
                        Menu("\(cl_major)") {
                            Button("소프트웨어공학",
                                   action: { cl_major = "소프트웨어공학"})
                            Button("정보통신공학",
                                   action: { cl_major = "정보통신공학"})
                            Button("컴퓨터공학",
                                   action: { cl_major = "컴퓨터공학"})
                            Button("인공지능공학",
                                   action: { cl_major = "인공지능공학"})
                            
                        }
                        .foregroundColor(Color(hex: 0x4F4F4F))
                        Spacer()
                            .padding()
                            .frame(width: 10, height: 50)
                            .cornerRadius(10)
                    }
                })
            HStack{
                Text("팀플유무")
                    .padding(.leading, 25)
                    .padding([.leading, .trailing])
                Rectangle().fill(Color(hex: 0xEFEFEF))
                    .frame(width: 170, height: 40)
                    .cornerRadius(10)
                    .overlay(content: {
                        HStack {
                            Menu("\(teample)") {
                                Button("1",
                                       action: { teample = "1"})
                                Button("2",
                                       action: { teample = "2"})
                                Button("3",
                                       action: { teample = "3"})
                                Button("4",
                                       action: { teample = "4"})
                                Button("5",
                                       action: { teample = "5"})
                                
                            }
                            .foregroundColor(Color(hex: 0x4F4F4F))
                            Spacer()
                                .padding()
                                .frame(width: 10, height: 50)
                                .cornerRadius(10)
                        }
                    })
            }
            HStack{
                Text("과제량")
                    .padding(.leading, 40)
                    .padding([.leading, .trailing])
                Rectangle().fill(Color(hex: 0xEFEFEF))
                    .frame(width: 170, height: 40)
                    .cornerRadius(10)
                    .overlay(content: {
                        HStack {
                            Menu("\(teample)") {
                                Button("1",
                                       action: { teample = "1"})
                                Button("2",
                                       action: { teample = "2"})
                                Button("3",
                                       action: { teample = "3"})
                                Button("4",
                                       action: { teample = "4"})
                                Button("5",
                                       action: { teample = "5"})
                                
                            }
                            .foregroundColor(Color(hex: 0x4F4F4F))
                            Spacer()
                                .padding()
                                .frame(width: 10, height: 50)
                                .cornerRadius(10)
                        }
                    })
            }
            
            HStack{
                Text("실습량")
                    .padding(.leading, 40)
                    .padding([.leading, .trailing])
                Rectangle().fill(Color(hex: 0xEFEFEF))
                    .frame(width: 170, height: 40)
                    .cornerRadius(10)
                    .overlay(content: {
                        HStack {
                            Menu("\(teample)") {
                                Button("1",
                                       action: { teample = "1"})
                                Button("2",
                                       action: { teample = "2"})
                                Button("3",
                                       action: { teample = "3"})
                                Button("4",
                                       action: { teample = "4"})
                                Button("5",
                                       action: { teample = "5"})
                                
                            }
                            .foregroundColor(Color(hex: 0x4F4F4F))
                            Spacer()
                                .padding()
                                .frame(width: 10, height: 50)
                                .cornerRadius(10)
                        }
                    })
            }
            HStack{
                Text("발표량")
                    .padding(.leading, 40)
                    .padding([.leading, .trailing])
                Rectangle().fill(Color(hex: 0xEFEFEF))
                    .frame(width: 170, height: 40)
                    .cornerRadius(10)
                    .overlay(content: {
                        HStack {
                            Menu("\(teample)") {
                                Button("1",
                                       action: { teample = "1"})
                                Button("2",
                                       action: { teample = "2"})
                                Button("3",
                                       action: { teample = "3"})
                                Button("4",
                                       action: { teample = "4"})
                                Button("5",
                                       action: { teample = "5"})
                                
                            }
                            .foregroundColor(Color(hex: 0x4F4F4F))
                            Spacer()
                                .padding()
                                .frame(width: 10, height: 50)
                                .cornerRadius(10)
                        }
                    })
            }
            TextField("강의총평 100자 제한", text: $allreview )
                .padding(.bottom, 50)
                .padding([.leading, .top])
                .frame(width: 350, height: 100)
                .background(Color(uiColor: .secondarySystemBackground))
                .cornerRadius(10)
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.black, lineWidth: 1)
            )
    }
}

struct meNuView_Previews: PreviewProvider {
    static var previews: some View {
        meNuView()
    }
}
