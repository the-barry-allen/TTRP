import SwiftUI

// MARK: - ContentView: Main entry point for the application
struct ContentView: View {
    // State variable to track the selected tab
    @State private var selectedTab = 0

    // Initializer to customize the appearance of the UITabBar
    init() {
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = UIColor.black
        UITabBar.appearance().standardAppearance = appearance
        if #available(iOS 15.0, *) {
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
        UITabBar.appearance().isTranslucent = false
    }

    // Body: Defines the user interface of the ContentView
    var body: some View {
        NavigationView {
            TabView(selection: $selectedTab) {
                // Home tab
                HomeView(selectedTab: $selectedTab)
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                    .tag(1)

                // Shop tab
                DefaultShopPage()
                    .tabItem {
                        Image(systemName: "bag.fill")
                        Text("Shop")
                    }
                    .tag(0)

                // Upload tab
                UploadView()
                    .tabItem {
                        Image("upload_icon")
                            .resizable()
                            .frame(width: 20, height: 20)
                    }
                    .tag(2)

                // Messages tab
                MessagesView()
                    .tabItem {
                        Image(systemName: "message.fill")
                        Text("Messages")
                    }
                    .tag(3)

                // Profile tab
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
}

// Preview provider for SwiftUI previews
#Preview {
    ContentView()
}
