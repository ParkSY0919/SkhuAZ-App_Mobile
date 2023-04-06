import SwiftUI

struct TabbarView: View {
    @State private var index = 3
    @State var button1: Bool = false
    var body: some View {
        TabView(selection: $index) {
            EvaluationView()
                .tabItem {
                    Text("강의평")
                }
                .tag(1)
              CurriculumView()
                .tabItem {
                    Text("커리큘럼")
                }
                .tag(2)
            MainView(index: $index)
                .tabItem {
                    Text("SKHUAZ")
                        .font(.system(size: 20))
                }
                .tag(3)
            RootView()
              .tabItem {
                  Text("루트추천")
              }
              .tag(4)
            SettingView()
              .tabItem {
                  Text("설정")
              }
              .tag(5)
            
            }
            .navigationBarHidden(true)
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
    }
}
