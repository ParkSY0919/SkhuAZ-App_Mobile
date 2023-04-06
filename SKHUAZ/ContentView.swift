//
//  ContentView.swift
//  SKHUAZ
//
//  Created by 천성우 on 2023/03/12.


import SwiftUI

struct ContentView: View {
    @State var isActive: Bool = false
        @State var loginSuccess = false
    var body: some View {
        LoginView(loginSuccess: $loginSuccess)
//        make()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
