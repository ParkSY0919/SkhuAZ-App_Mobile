import Foundation
import SwiftUI

extension Color {
  init(hex: String) {
    let scanner = Scanner(string: hex)
    _ = scanner.scanString("#")
    
    var rgb: UInt64 = 0
    scanner.scanHexInt64(&rgb)
    
    let r = Double((rgb >> 16) & 0xFF) / 255.0
    let g = Double((rgb >>  8) & 0xFF) / 255.0
    let b = Double((rgb >>  0) & 0xFF) / 255.0
    self.init(red: r, green: g, blue: b)
  }
}
extension Color {
 
    static let mainButtonColor = Color(hex: "#C28D8D")
}

struct redButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: UIScreen.main.bounds.width / 3.0 , height: UIScreen.main.bounds.height / 10.0)
            .padding()
            .background(Color.white)
            .foregroundColor(.mainButtonColor)
            .clipShape(Rectangle())
            .overlay { // <-
                Rectangle().stroke(Color.mainButtonColor, lineWidth: 5)
            .cornerRadius(5)
              }
            .font(.system(size: 15, weight: .semibold))

    }
}

extension Color {
 
    static let edgeColor = Color(hex: "#C2E7F5")
    static let highlightedgeColor = Color(hex: "#1CA6DE")
    static let highlihtFillColor = Color(hex: "#C2E7F5")

    }
struct redSubjecButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: UIScreen.main.bounds.width / 3.0 , height: UIScreen.main.bounds.height / 13.0)
            .padding()
            .background(Color.white)
            .foregroundColor(.mainButtonColor)
            .clipShape(Rectangle())
            .overlay { // <-
                Rectangle().stroke(Color.mainButtonColor, lineWidth: 5)
              }
            .cornerRadius(5)
            .font(.system(size: 15, weight: .semibold))

    }
}
struct highlightButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: UIScreen.main.bounds.width / 3.0 , height: UIScreen.main.bounds.height / 30.0)
            .padding()
            .background(Color.mainButtonColor)
            .foregroundColor(.white)
            .clipShape(Rectangle())
            .overlay { // <-
                Rectangle().stroke(Color.mainButtonColor, lineWidth: 5)
              }
            .cornerRadius(5)
            .font(.system(size: 12, weight: .semibold))
    }
}
struct redSettingecButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: UIScreen.main.bounds.width / 4 * 3 , height: UIScreen.main.bounds.height / 50.0)
            .padding()
            .background(Color.white)
            .foregroundColor(.black)
            .clipShape(Rectangle())
            .overlay { // <-
                Rectangle().stroke(Color.black, lineWidth: 5)
            }
            .cornerRadius(5)
            .font(.system(size: 15, weight: .semibold))
        
    }
}
