import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0

    init() {
        UITabBar.appearance().barTintColor = UIColor.black
        UITabBar.appearance().unselectedItemTintColor = UIColor.white.withAlphaComponent(0.6)
        UITabBar.appearance().isTranslucent = false
    }

    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(0)

            DiscoverView()
                .tabItem {
                    Image(systemName: "bag.fill")
                    Text("Shop")
                }
                .tag(1)

            UploadView()
                .tabItem {
                    Image(systemName: "plus.app.fill")
                        .foregroundColor(.blue)

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

struct HomeView: View {
    var body: some View {
        Text("Home")
            .font(.largeTitle)
            .foregroundColor(.white)
            .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}

struct DiscoverView: View {
    var body: some View {
        Text("Discover")
            .font(.largeTitle)
            .foregroundColor(.white)
            .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}

struct UploadView: View {
    var body: some View {
        Text("Upload")
            .font(.largeTitle)
            .foregroundColor(.white)
            .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}

struct MessagesView: View {
    var body: some View {
        Text("Messages")
            .font(.largeTitle)
            .foregroundColor(.white)
            .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}

struct ProfileView: View {
    var body: some View {
        Text("Profile")
            .font(.largeTitle)
            .foregroundColor(.white)
            .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}

#Preview {
    ContentView()
}
