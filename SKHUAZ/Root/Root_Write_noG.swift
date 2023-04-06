//
//  Evaluation_Write.swift
//  SkhuAZ
//
//  Created by 박신영 on 2023/03/11.
//

import SwiftUI

struct Root_Write_noG: View {
    @State var input : String = ""
    var body: some View {
        VStack {
            VStack {
                Text("촉촉한 초코칩 님은 지금 2023-1 학기 입니다.")
                    .font(.system(size: 18))
                    .padding(.top, 20)
                
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: 2)
                    .frame(width: 370, height: 450)
                    .padding(5)
                    .overlay(content: {
                        VStack(content: {
                            TextField("제목을 작성해주세요 (최대 45자)", text: $input)
                                .padding(.leading)
                                .frame(width: 350, height: 40)
                                .background(Color(hex: 0xEFEFEF))
                                .cornerRadius(10)
                            
                            HStack {
                                Rectangle().fill(Color(hex: 0xEFEFEF))
                                    .frame(width: 350, height: 40)
                                    .cornerRadius(10)
                                    .overlay(content: {
                                        Menu("전공을 선택해주세요") {
                                                    Button("소프트웨어공학전공", action: {})
                                                    Button("컴퓨터공학전공", action: {})
                                                    Button("정보통신공학전공", action: {})
                                                    Button("인공지능공학전공", action: {})
                                                }
                                    })
                            }
                            Rectangle().fill(Color(hex: 0xEFEFEF))
                                .frame(width: 350, height: 40)
                                .cornerRadius(10)
                                .overlay(content: {
                                    HStack {
                                        Text("촉촉한 초코칩").font(.system(size: 15))
                                            .padding(.leading)
                                        Spacer()
                                        Text("2023-03-23 09:19").font(.system(size: 15))
                                            .padding(.horizontal)
                                    }
                                })
                            
                            Rectangle().fill(Color(hex: 0x4F4F4F))
                                .frame(width: 350, height: 40)
                                .cornerRadius(10)
                                .overlay(content: {
                                    HStack {
                                        Text("루트 가져오기")
                                            .foregroundColor(Color.white)
                                            .font(.system(size: 15))
                                    }
                                })
                            
                            Rectangle().fill(Color(hex: 0xEFEFEF))
                                .frame(width: 350, height: 60)
                                .cornerRadius(10)
                                .overlay(content: {
                                    HStack {
                                        Text("최근 진행한 선수과목제도가 표시됩니다.").font(.system(size: 15))
                                    }
                                })
                            
                            TextField("루트추천 설명을 작성해주세요 (최대 100자)", text: $input)
                                .padding(.leading, 10)
                                .padding(.bottom, 120)
                                .frame(width: 350, height: 160)
                                .background(Color(hex: 0xEFEFEF))
                                .cornerRadius(10)
                            
                            
                            
                            
                        })
                    })
                
            }
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
            
            Rectangle().fill(Color(hex: 0xEFEFEF))
                .frame(width: 350, height: 40)
                .cornerRadius(10)
                .overlay(content: {
                    HStack {
                        Text("목록으로")
                            .foregroundColor(Color.black)
                            .font(.system(size: 15))
                    }
                })
            Spacer()
        }
    }
}

struct Root_Write_noG_Previews: PreviewProvider {
    static var previews: some View {
        Root_Write_noG()
    }
}
