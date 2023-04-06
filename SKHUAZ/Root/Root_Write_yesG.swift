//
//  Evalution_Write_yesG.swift
//  SkhuAZ
//
//  Created by 박신영 on 2023/03/11.
//

import SwiftUI

struct Root_Write_yesG: View {
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
                            
                            Rectangle().fill(Color(hex: 0xEFEFEF))
                                .frame(width: 350, height: 40)
                                .cornerRadius(10)
                                .overlay(content: {
                                    HStack {
                                        Text("전공구분")
                                            .foregroundColor(Color.black)
                                            .font(.system(size: 15))
                                            .padding(.leading, 17)
                                        Spacer()
                                    }
                                })
                            HStack {
                                Text("2학년")
                                    .frame(width: 50)
                                    .font(.system(size: 15))
                                    .background(Color.white)
                                    .padding(.leading, 15)
                                Rectangle().fill(Color(hex: 0xEFEFEF))
                                    .frame(width: 115, height: 40)
                                    .cornerRadius(10)
                                    .overlay(content: {
                                        Menu("선택") {
                                                    Button("Cancel", action: {})
                                                    Button("Search", action: {})
                                                    Button("Add", action: {})
                                                }
                                    })
                                Spacer()
                            }
                            
                            HStack {
                                Text("3학년")
                                    .frame(width: 50)
                                    .font(.system(size: 15))
                                    .background(Color.white)
                                    .padding(.leading, 15)
                                Rectangle().fill(Color(hex: 0xEFEFEF))
                                    .frame(width: 115, height: 40)
                                    .cornerRadius(10)
                                    .overlay(content: {
                                        Menu("선택") {
                                                    Button("Cancel", action: {})
                                                    Button("Search", action: {})
                                                    Button("Add", action: {})
                                                }
                                    })
                                Spacer()
                            }
                            
                            HStack {
                                Text("4학년")
                                    .frame(width: 50)
                                    .font(.system(size: 15))
                                    .background(Color.white)
                                    .padding(.leading, 15)
                                Rectangle().fill(Color(hex: 0xEFEFEF))
                                    .frame(width: 115, height: 40)
                                    .cornerRadius(10)
                                    .overlay(content: {
                                        Menu("선택") {
                                                    Button("Cancel", action: {})
                                                    Button("Search", action: {})
                                                    Button("Add", action: {})
                                                }
                                    })
                                Spacer()
                            }
                            
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
struct Root_Write_yesG_Previews: PreviewProvider {
    static var previews: some View {
        Root_Write_yesG()
    }
}
