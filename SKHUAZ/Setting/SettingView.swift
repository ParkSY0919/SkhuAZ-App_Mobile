//
//  SettingView.swift
//  pbch
//
//  Created by 문인호 on 2023/03/13.
//

import SwiftUI

struct SettingView: View {
    
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView{
            VStack(spacing: 30){
                Image("skhuazbanner")
                    .resizable()
                    .frame(width: 400, height: 200)
                    .padding(.bottom, 5)
                NavigationLink {
                    authView()
                } label: {
                    HStack{
                        Image("setprofile")
                            .resizable()
                            .frame(width: 40,height: 40,alignment: .leading)
                        Text("프로필 편집")
                    }
                }
                .buttonStyle(redSettingecButton())
                
                NavigationLink {
                    setalarmView()
                } label: {
                    HStack{
                        Image("setalarm")
                            .resizable()
                            .frame(width: 40,height: 40,alignment: .leading)
                        Text("알람 설정")
                    }                    }
                .buttonStyle(redSettingecButton())
                NavigationLink {
                    setModeView()
                } label: {
                    HStack{
                        Image("setmode")
                            .resizable()
                            .frame(width: 40,height: 40,alignment: .leading)
                        Text("모드 설정")
                    }                    }
                .buttonStyle(redSettingecButton())
                NavigationLink {
                    communityRuleView()
                } label: {
                    HStack{
                        Image("communityrule")
                            .resizable()
                            .frame(width: 40,height: 40,alignment: .leading)
                        Text("이용 규칙")
                    }                    }
                .buttonStyle(redSettingecButton())
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("회원탈퇴")
                    
                }
                //                NavigationLink {
                //                    quitAccountView()
                //                } label: {
                //                    Text("회원 탈퇴")
                //                }
                .frame(width: UIScreen.main.bounds.width / 4 * 3 , height: UIScreen.main.bounds.height / 50.0)
                .padding()
                .background(Color.white)
                .clipShape(Rectangle())
                .overlay { // <-
                    Rectangle().stroke(Color.black, lineWidth: 5)
                }
                .cornerRadius(5)
                .font(.system(size: 15, weight: .semibold))
                
                .foregroundColor(.mainButtonColor)
                Text("© 2023. ( PBCH^2YM ) all right reserved")
                Text("")
            }
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
