import Foundation
import SwiftUI

struct LisTView: View {
    @State var test: String = ""
    @State var testpoint: Int = 4
    var body: some View{
        Group{
            VStack(spacing: 10){
                Group{
                    HStack{
                        Text("강의명 | 교수명 | 수강학기")
                        Spacer()
                        Text("☆★★★★")
                    }
                    .font(.system(size: 14))
                    .padding()
                }
                .frame(width: 320, height: 40)
                .background(Color(uiColor: .secondarySystemBackground))
                Group{
                    HStack{
                        VStack(alignment:.trailing, spacing: 8){
                            Text("팀플 유무")
                            Text("과제량")
                            Text("실습량")
                            Text("발표량")
                        }
                        .font(.system(size: 12))
                        VStack(alignment:.leading){
                            Text("5점 기준 그래프")
                                .frame(width: 260, height: 15)
                                .background(Color(hex: 0x9AC1D1))
                            Text("3점 기준 그래프")
                                .frame(width: 156, height: 15)
                                .background(Color(hex: 0x9AC1D1))
                            Text("1점")
                                .frame(width: 52, height: 15)
                                .background(Color(hex: 0x9AC1D1))
                            chartView(point: $testpoint)
                        }
                        .frame(width: 260, height: 90)
                        .background(Color(uiColor: .secondarySystemBackground))

                    }
                }
                .frame(width: 320, height: 100)
                Group{
                    TextField("강의총평 100자 제한", text: $test)
                        .padding([.bottom], 30)
                        .padding([.leading], 10)
                        .frame(width: 320, height: 60)
                        .font(.system(size: 10))
                        .background(Color(uiColor: .secondarySystemBackground))
                }
                .padding(.bottom, 10)
                HStack{
                    Text("작성자 | 작성일")
                        .padding(.leading, 15)
                    Spacer()
//                    Button(action: {}, label: {
//                        Text("추천")
//                            .padding(.horizontal, 20)
//                    })
//                    .foregroundColor(.black)
//                    .frame(width: 85, height: 24)
//                    .background(Color(hex: 0x9AC1D1))
//                    .cornerRadius(10)
//                    Button(action: {}, label: {
//                        Text("비추천")
//                            .padding(.horizontal, 20)
//                    })
//                    .foregroundColor(.black)
//                    .frame(width: 85, height: 24)
//                    .background(Color(hex: 0xEFEFEF))
//                    .cornerRadius(10)
//                    .padding(.trailing, 15)
                }
                .font(.system(size: 12))

            }

        }
        .frame(width: 350, height: 300)
        .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.black, lineWidth: 1))
    }
}
struct chartView: View{
    @Binding var point: Int
    var body: some View{
        if point == 1 {
            Text("1")
                .frame(width: 52, height: 15)
                .background(Color(hex: 0x9AC1D1))
        }
        else if point == 2 {
            Text("2")
                .frame(width: 104, height: 15)
                .background(Color(hex: 0x9AC1D1))
        }
        else if point == 3 {
            Text("3")
                .frame(width: 156, height: 15)
                .background(Color(hex: 0x9AC1D1))
        }
        else if point == 4 {
            Text("4")
                .frame(width: 208, height: 15)
                .background(Color(hex: 0x9AC1D1))
        }
        else if point == 5 {
            Text("5점테스트")
            .frame(width: 260, height: 15)
            .background(Color(hex: 0x9AC1D1))
        }
    }
}



struct LisTView_Previews: PreviewProvider {
    static var previews: some View {
        LisTView()
    }
}
