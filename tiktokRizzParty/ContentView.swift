import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0

    init() {
        UITabBar.appearance().barTintColor = UIColor.black
        UITabBar.appearance().isTranslucent = true
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
                    Image(systemName: "plus.app.fill")
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
        .background(Color.black.edgesIgnoringSafeArea(.all)) // Background color for the tab bar
    }
}


#Preview {
    ContentView()
}
