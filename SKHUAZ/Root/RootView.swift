//
//  EvaluationView.swift
//  SkhuAZ
//
//  Created by 박신영 on 2023/03/11.
//

import Charts
import SwiftUI

struct Posting: Identifiable {
  let name: String
  let count: Int
  
  var id: String { name }
}

struct RootView: View {
    
    @State private var input = ""
    @State private var review = ""
   
    var body: some View {
        VStack{
            /**검색창**/
            HStack{
                TextField("강의를 검색해주세요", text: $input)
                    .padding(.leading)
                    .frame(width: 300, height: 40)
                    .background(Color(.white))
                    .border(Color(hex: 0x9AC1D1),width: 5)
                
                Image("검색버튼")
                    .padding()
                    .frame(width: 50, height: 30)
                    .aspectRatio(contentMode: .fit)
                
            }
            
            
            /**전공 선택 파트**/
            HStack {
                Major_Box()
                VStack(alignment: .center) {
                    
                    Image("글쓰기 버튼")
                        .padding()
                        .frame(width: 50, height: 30)
                        .aspectRatio(contentMode: .fit)
                }
                
            }
            
            ScrollView(showsIndicators: false, content: {
                VStack {
                    ForEach(0..<10) {_ in
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 2)
                            .frame(width: 370, height: 60)
                            .padding(5)
                            .overlay(
                                HStack {
                                    Spacer()
                                      Text("드디어 찾았다")
                                        .foregroundColor(.black)
                                        .font(.system(size: 20))
                                    Spacer()
                                    
                                    Text("소프트웨어공학전공 | 자바프로그래밍, 웹개발입문")
                                      .foregroundColor(.black)
                                      .font(.system(size: 10))
                                    Spacer()
                                    Spacer()
                                }
                            )
                    }
                }
            })
        }
        
    }
}




struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
