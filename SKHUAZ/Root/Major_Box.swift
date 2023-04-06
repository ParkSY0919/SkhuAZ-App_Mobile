//
//  Major_Box.swift
//  SkhuAZ
//
//  Created by 박신영 on 2023/03/11.
//

import Foundation
import SwiftUI

struct Major_Box: View {    var body: some View {
        
        ScrollView(.horizontal,showsIndicators: false, content: {
            Rectangle().fill(Color.white)
                .frame(height: 5)
            HStack {
                Rectangle()
                    .fill(Color.white)
                    .frame(width: 10)
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color(hex: 0xCF8D8D))
                        .frame(width: 135, height: 25)
                    
                    Text("소프트웨어공학전공")
                        .font(.system(size: 15)).foregroundColor(.white)
                        .multilineTextAlignment(.center)
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color(hex: 0xCF8D8D))
                        .frame(width: 135, height: 25)
                    
                    Text("정보통신공학전공")
                        .font(.system(size: 15)).foregroundColor(.white)
                    
                        
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color(hex: 0xCF8D8D))
                        .frame(width: 135, height: 25)
                    
                    Text("컴퓨터공학전공")
                        .font(.system(size: 15)).foregroundColor(.white)
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color(hex: 0xCF8D8D))
                        .frame(width: 135, height: 25)
                    
                    Text("인공지능공학전공")
                        .font(.system(size: 15)).foregroundColor(.white)
                }
            }
        })
        .frame(width: 300, height: 50)
    }
}
