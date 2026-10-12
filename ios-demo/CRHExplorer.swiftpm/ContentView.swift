import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem { Label("首页", systemImage: "tram.fill") }
            FactsView()
                .tabItem { Label("知识卡", systemImage: "book.fill") }
            SpeedView()
                .tabItem { Label("开动", systemImage: "speedometer") }
            QuizView()
                .tabItem { Label("小测验", systemImage: "questionmark.circle.fill") }
        }
        .tint(.crhBlue)
    }
}

extension Color {
    static let crhBlue = Color(red: 0.05, green: 0.33, blue: 0.68)
    static let crhLight = Color(red: 0.90, green: 0.94, blue: 0.98)
}

#Preview {
    ContentView()
}
