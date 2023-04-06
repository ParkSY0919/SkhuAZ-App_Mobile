//
//  CurriculumJavaView.swift
//  pbch
//
//  Created by 문인호 on 2023/03/13.
//

import SwiftUI

struct CurriculumJavaView: View {
    var body: some View {
        VStack(spacing: 50){
            Image("skhuazbanner")
                .resizable()
                .frame(width: 400, height: 200)
                .padding(.bottom, 5)
            HStack{
                NavigationLink {
                    CurriculumJavaView()
                } label: {
                    Text("소프트웨어공학전공")
                }
            }
            .buttonStyle(highlightButton())
            HStack(spacing: 20){
                Spacer()
                NavigationLink {
                    CurriculumJavaView()
                } label: {
                    Text("자료구조")
                }
                .buttonStyle(redSubjecButton())
                NavigationLink {
                    CurriculumJavaView()
                } label: {
                    Text("네트워크 프로그래밍")
                }
                .buttonStyle(redSubjecButton())
                Spacer()
            }
            HStack(spacing: 20){
                Spacer()
                NavigationLink {
                    CurriculumJavaView()
                } label: {
                    Text("자료구조")
                }
                .buttonStyle(redSubjecButton())
                NavigationLink {
                    CurriculumJavaView()
                } label: {
                    Text("네트워크 프로그래밍")
                }
                .buttonStyle(redSubjecButton())
                Spacer()
            }
            HStack(spacing: 20){
                Spacer()
                NavigationLink {
                    CurriculumJavaView()
                } label: {
                    Text("자료구조")
                }
                .buttonStyle(redSubjecButton())
                NavigationLink {
                    CurriculumJavaView()
                } label: {
                    Text("네트워크 프로그래밍")
                }
                .buttonStyle(redSubjecButton())
                Spacer()
            }
            NavigationLink {
                CurriculumJavaView()
            } label: {
                Text("고급 자바 프로그래밍")
            }
            .buttonStyle(redSubjecButton())
            .frame(alignment: .center)
        }
    }
}

struct CurriculumJavaView_Previews: PreviewProvider {
    static var previews: some View {
        CurriculumJavaView()
    }
}
