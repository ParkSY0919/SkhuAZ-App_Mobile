//
//  CheckBoxView.swift
//  skhuaz
//
//  Created by 봉주헌 on 2023/03/11.
//

import SwiftUI

struct CheckBoxView: View {
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false, content: {
            HStack{
                
                Button(action: {
                    
                }, label: {
                    Text("소프트웨공학전공")
                        .padding()
                        .frame(width: 150, height: 30)
                        .background(Color(hex: 0xCF8D8D))
                        .foregroundColor(.white)
                        .cornerRadius(7)
                        
                })
                Button(action: {
                    
                }, label: {
                    Text("컴퓨터공학전공")
                        .padding()
                        .frame(width: 150, height: 30)
                        .background(Color(hex: 0xCF8D8D))
                        .foregroundColor(.white)
                        .cornerRadius(7)
                        
                })
                Button(action: {
                    
                }, label: {
                    Text("정보통신공학전공")
                        .padding()
                        .frame(width: 150, height: 30)
                        .background(Color(hex: 0xCF8D8D))
                        .foregroundColor(.white)
                        .cornerRadius(7)
                        
                })
                Button(action: {
                    
                }, label: {
                    Text("인공지능공학전공")
                        .padding()
                        .frame(width: 150, height: 30)
                        .background(Color(hex: 0xCF8D8D))
                        .foregroundColor(.white)
                        .cornerRadius(7)
                       
                })
            }
            .frame(maxWidth: .infinity)
            .padding(.leading)
        }
)}
}
struct CheckBoxView_Previews: PreviewProvider {
    static var previews: some View {
        CheckBoxView()
    }
}
