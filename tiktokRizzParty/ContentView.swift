import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0

    init() {
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = UIColor.black
        UITabBar.appearance().standardAppearance = appearance
        if #available(iOS 15.0, *) {
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
        UITabBar.appearance().isTranslucent = false
    }

    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(1)

            ShopView()
                .tabItem {
                    Image(systemName: "bag.fill")
                    Text("Shop")
                }
                .tag(0)

            UploadView()
                .tabItem {
                    Image("upload_icon")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
                .tag(2)

            MessagesView()
                .tabItem {
                    Image(systemName: "message.fill")
                    Text("Messages")
                }
                .tag(3)

            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
                .tag(4)
        }
        .accentColor(.white) // Tab bar icon and text color when selected
    }
}

#Preview {
    ContentView()
}
