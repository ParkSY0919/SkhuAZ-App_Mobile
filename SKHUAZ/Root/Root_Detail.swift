//
//  Evaluation_Detail.swift
//  SkhuAZ
//
//  Created by 박신영 on 2023/03/11.
//

import SwiftUI

struct Root_Detail: View {
    var body: some View {
            VStack {
                Text("촉촉한 초코칩 님은 지금 2023-1 학기 입니다.")
                    .font(.system(size: 17))
                    .padding(.top, 20)
                
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: 2)
                    .frame(width: 370, height: 400)
                    .padding(5)
                    .overlay(content: {
                        VStack(content: {
                            Rectangle().fill(Color(hex: 0xEFEFEF))
                                .frame(width: 350, height: 40)
                                .cornerRadius(10)
                                .overlay(content: {
                                    HStack {
                                        Text("드디어 찾음")
                                            .foregroundColor(Color.black)
                                            .font(.system(size: 15))
                                            .padding(.leading, 17)
                                        Spacer()
                                    }
                                })
                            
                            Rectangle().fill(Color(hex: 0xEFEFEF))
                                .frame(width: 350, height: 40)
                                .cornerRadius(10)
                                .overlay(content: {
                                    HStack {
                                        Text("소프트웨어공학전공")
                                            .foregroundColor(Color.black)
                                            .font(.system(size: 15))
                                            .padding(.leading, 17)
                                        Spacer()
                                    }
                                })
                            
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
                            
                            Rectangle().fill(Color(hex: 0xEFEFEF))
                                .frame(width: 350, height: 60)
                                .cornerRadius(10)
                                .overlay(content: {
                                    HStack {
                                        Text("자바로그래밍 > 자료구조, 알고리즘 > 자바프로젝트").font(.system(size: 15))
                                    }
                                })
                            
                            Text("컴퓨터공학전공과 소프트웨어공학전공을 병행하는 최고의 방법")
//                                .alignmentGuide(.leading) { d in d[.leading] }
                                .font(.system(size: 15))
                                .padding(.bottom, 90)
                                .frame(width: 350, height: 160)
                                .background(Color(hex: 0xEFEFEF))
                                .cornerRadius(10)
                            
                            
                            
                            
                        })
                    })
                
            }
            
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

struct Root_Detail_Previews: PreviewProvider {
    static var previews: some View {
        Root_Detail()
    }
}
