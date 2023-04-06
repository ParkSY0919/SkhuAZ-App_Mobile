//
//  CurriculumView.swift
//  pbch
//
//  Created by 문인호 on 2023/03/13.
//

import SwiftUI
struct CurriculumView: View {
    var body: some View {
        NavigationView{
                VStack(spacing: 40){
                    Image("skhuazbanner")
                        .resizable()
                        .frame(width: 400, height: 200)
                        .padding(.bottom, 5)
                    HStack(spacing: 40){
                        NavigationLink {
                            CurriculumSWView()
                        } label: {
                            Text("소프트웨어공학전공")
                        }
                        .buttonStyle(redButton())
                        NavigationLink {
                            CurriculumSWView()
                        } label: {
                            Text("컴퓨터공학전공")
                        }
                        .buttonStyle(redButton())
                    }
                    HStack(spacing: 40){
                        NavigationLink {
                            CurriculumSWView()
                        } label: {
                            Text("정보통신공학전공")
                        }
                        .buttonStyle(redButton())
                        NavigationLink {
                            CurriculumSWView()
                        } label: {
                            Text("인공지능공학전공")
                        }
                        .buttonStyle(redButton())
                    }
                    Spacer()
            }
        }
    }
}

struct CurriculumView_Previews: PreviewProvider {
    static var previews: some View {
        CurriculumView()
    }
}
