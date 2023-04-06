//
//  EvaluationView.swift
//  PBC
//
//  Created by 봉주헌 on 2023/03/06.
//
import Charts
import SwiftUI


struct EvaluationView: View {
    
    @State private var input: String = ""
    
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    TextField("강의를 입력해주세요", text: $input)
                        .padding(.leading, 10)
                        .frame(width: 300, height: 50)
                        .background(Color(uiColor: .secondarySystemBackground))
                        .cornerRadius(10)
                    
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color(hex: 0x9AC1D1), lineWidth: 3))
                    
                    Button(action: {}, label: {
                        Image("검색버튼")
                            .padding()
                            .frame(width: 40)
                    })
                    .padding(.leading, 11)
                }
                HStack{
                    CheckBoxView()
                        .padding(.leading, 1)
                    NavigationLink(
                        destination: EvaluationDetail(),
                        label: {
                            Image(systemName: "square.and.pencil")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(.bottom, 5)
                                .foregroundColor(Color(hex: 0x9AC1D1))
                                .padding(.trailing, 15)
                                .frame(width: 50, height: 35)
                        })
                }
                .padding(.bottom, 10)
                
                ScrollView(.vertical, showsIndicators: false, content:  {
                    LisTView()
                        .padding(.top, 15)
                    LisTView()
                        
                })
                .padding(.top, -20)
            }

        }
        .navigationBarBackButtonHidden(true)
    }
}



struct EvaluationView_Previews: PreviewProvider {
    static var previews: some View {
        EvaluationView()
    }
}
