//
//  EvaluationDetailView.swift
//  skhuaz
//
//  Created by 봉주헌 on 2023/03/11.
//

import SwiftUI

struct EvaluationDetail: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView{
            VStack {
                Text("촉촉한 초코칩 님은 지금 2023-1 학기 입니다.")
                    .font(.system(size: 17))
                    .padding(.top, 20)
                meNuView()
                    .padding()
                
                Rectangle().fill(Color(hex: 0x9AC1D1))
                    .frame(width: 350, height: 40)
                    .cornerRadius(10)
                    .overlay(content: {
                        HStack {
                            Button{
                                self.presentationMode.wrappedValue.dismiss()
                            } label: {
                                Text("저장")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 15))
                            }
                        }
                    })
                
                Rectangle().fill(Color(hex: 0xEFEFEF))
                    .frame(width: 350, height: 40)
                    .cornerRadius(10)
                    .overlay(content: {
                        HStack {
                            Button{
                                self.presentationMode.wrappedValue.dismiss()
                            } label: {
                                
                                    Text("목록으로")
                                        .foregroundColor(Color.black)
                                        .font(.system(size: 15))
                                
                            }
                            
                        }
                    })
                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct EvaluationDetailPreviews: PreviewProvider {
    static var previews: some View {
        EvaluationDetail()
    }
}
