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
                .tag(0)

            ShopView()
                .tabItem {
                    Image(systemName: "bag.fill")
                    Text("Shop")
                }
                .tag(1)

            UploadView()
                .tabItem {
                    CustomTabIcon()
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

struct CustomTabIcon: View {
    var body: some View {
        ZStack {
            // Your complex icon composition
            Image(systemName: "circle.fill")
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(.blue)
            Image(systemName: "plus")
                .resizable()
                .frame(width: 12, height: 12)
                .foregroundColor(.white)
        }
    }
}

#Preview {
    ContentView()
}
