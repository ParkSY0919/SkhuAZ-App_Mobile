//
//  Root_WriteButton.swift
//  SKHUAZ
//
//  Created by 박신영 on 2023/05/03.
//

import SwiftUI


//
//  write_button.swift
//  SKHUAZ
//
//  Created by 박신영 on 2023/04/12.
//

import SwiftUI

struct Root_WriteButton: View {
    @State var Evalution_write = false
    var body: some View {
        HStack {
            Text("")
                .frame(width:20)
            VStack(alignment: .center) {
                Text("")
                    .frame(height: 15)
                Button(action: {
                    
                    Evalution_write = true
                    
                }) {
                    Image(systemName: "square.and.pencil")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.bottom, 5)
                        .foregroundColor(Color(hex: 0x9AC1D1))
                        .padding(.trailing, 15)
                        .frame(width: 50, height: 35)
                }
                .padding(.bottom, 10)
                NavigationLink(destination: Root_Write_noG(), isActive: $Evalution_write) {
                        
                        EmptyView()
                    }
            }.padding(.bottom, 10)
            Text("")
                .frame(width:10)
        }
    }
}

struct Root_WriteButton_Previews: PreviewProvider {
    static var previews: some View {
        write_button()
    }
}

