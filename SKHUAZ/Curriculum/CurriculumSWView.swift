//
//  CurriculumSWView.swift
//  pbch
//
//  Created by 문인호 on 2023/03/13.
//

import SwiftUI

struct CurriculumSWView: View {
    var body: some View {
        ScrollView{
            VStack(spacing: 50){
                Image("skhuazbanner")
                    .resizable()
                    .frame(width: 400, height: 200)
                    .padding(.bottom, 5)
                Button {
                    print("SW")
                } label: {
                    Text("소프트웨어공학전공")
                }
                .buttonStyle(highlightButton())
                
                HStack(spacing: 20){
                    Spacer()
                    NavigationLink {
                        CurriculumJavaView()
                    } label: {
                        Text("자바 프로그래밍")
                    }
                    .buttonStyle(redSubjecButton())
                    NavigationLink {
                        CurriculumJavaView()
                    } label: {
                        Text("웹 개발 입문")
                    }
                    .buttonStyle(redSubjecButton())
                    Spacer()
                }
                HStack(spacing: 20){
                    Spacer()
                    NavigationLink {
                        CurriculumJavaView()
                    } label: {
                        Text("Python 프로그래밍")
                    }
                    .buttonStyle(redSubjecButton())
                    NavigationLink {
                        CurriculumJavaView()
                    } label: {
                        Text("데이터베이스")
                    }
                    .buttonStyle(redSubjecButton())
                    Spacer()
                }
                HStack(spacing: 20){
                    Spacer()
                    NavigationLink {
                        CurriculumJavaView()
                    } label: {
                        Text("데이터 통신")
                    }
                    .buttonStyle(redSubjecButton())
                    NavigationLink {
                        CurriculumJavaView()
                    } label: {
                        Text("운영체제")
                    }
                    .buttonStyle(redSubjecButton())
                    Spacer()
                }
                NavigationLink {
                    CurriculumJavaView()
                } label: {
                    Text("사물 인터넷")
                }
                .buttonStyle(redSubjecButton())
            }
            }
    }
}
    struct CurriculumSWView_Previews: PreviewProvider {
        static var previews: some View {
            CurriculumSWView()
        }
    }
