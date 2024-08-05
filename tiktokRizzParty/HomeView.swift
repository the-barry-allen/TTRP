//
//  HomeView.swift
//  tiktokRizzParty
//
//  Created by Simantak Dabhade on 1/7/24.
//
import SwiftUI

// MARK: - HomeView: Main view for the home screen
struct HomeView: View {
    @State private var tabBarHeight: CGFloat = 0
    @Binding var selectedTab: Int

    var body: some View {
        // Using SwipeView to create a swipeable view with dynamic pages
        SwipeView(pages: generatePages())
    }

    // Function to generate an array of pages dynamically
    private func generatePages() -> [AnyView] {
        return [
            AnyView(FYPPage(isBdayPage: false, selectedTab: $selectedTab)),
            AnyView(FYPPage(isBdayPage: false, selectedTab: $selectedTab)),
            AnyView(FYPPage(isBdayPage: true, selectedTab: $selectedTab))
        ]
    }
}

// MARK: - SwipeView: Generic view that enables swiping between pages
struct SwipeView: View {
    var pages: [AnyView] // Array of pages to swipe through
    @State private var currentPage = 0 // State to track the current page
    @GestureState private var translation: CGFloat = 0 // State to track the gesture translation

    var body: some View {
        GeometryReader { geometry in // Using GeometryReader to get the size of the parent view
            VStack(spacing: 0) { // Vertical stack to hold the pages
                ForEach(0..<pages.count, id: \.self) { index in // Loop through each page
                    pages[index] // Access each page
                        .frame(width: geometry.size.width, height: UIScreen.main.bounds.height) // Set the frame of each page
                        .offset(y: -CGFloat(self.currentPage) * UIScreen.main.bounds.height) // Offset the pages based on the current page
                        .offset(y: self.translation) // Apply the translation offset
                        .animation(.interactiveSpring(), value: self.currentPage) // Apply spring animation to page changes
                        .animation(.interactiveSpring(), value: self.translation) // Apply spring animation to translation
                }
            }
            .ignoresSafeArea() // Ignore safe area insets
            .gesture(
                DragGesture() // Detect drag gestures
                    .updating(self.$translation) { value, state, _ in // Update the translation state with the drag value
                        state = value.translation.height
                    }
                    .onEnded { value in // Action to perform when drag ends
                        self.handleDragEnd(value: value) // Handle the end of the drag gesture
                    }
            )
        }
        .background(Color.black.edgesIgnoringSafeArea(.all)) // Set background color to black and ignore safe area
    }

    // Function to handle the end of the drag gesture
    private func handleDragEnd(value: DragGesture.Value) {
        let offset = value.translation.height / (UIScreen.main.bounds.height / 3) // Calculate offset factor for swipe threshold
        let newIndex = (CGFloat(self.currentPage) - offset).rounded() // Determine the new page index based on the offset
        self.currentPage = min(max(Int(newIndex), 0), self.pages.count - 1) // Ensure the new index is within valid bounds
    }
}

// Preview provider for SwiftUI previews
#Preview {
    ContentView()
}
