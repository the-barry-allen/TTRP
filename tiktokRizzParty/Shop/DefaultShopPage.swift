//
//  DefaultShopPage.swift
//  tiktokRizzParty
//
//  Created by Simantak Dabhade on 7/7/24.
//
import SwiftUI

// MARK: - DefaultShopPage: Main view for the default TikTok shop page
struct DefaultShopPage: View {
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                // Top menu with options
                HStack {
                    Menu {
                        Text("My TikTok Shop")
                        Text("Kushal's Birthday Shopping Page")
                        Text("Create New Shopping Page")
                    } label: {
                        Image(systemName: "menucard.fill")
                            .bold()
                            .font(.system(size: 25))
                            .foregroundColor(.blue)
                    }
                    .padding()
                    Spacer()
                }
                Spacer()
            }

            VStack {
                // Instructional text
                Text("This page is your main TikTok shop page, you can click on the icon at the top left to go to the Shareable Custom pages")
                    .padding()

                Text("For the purpose of this demo, go to the FYP and scroll till you see our shopping card. Click on an item there to see the custom shopping pages!")
                    .font(.headline)
                    .padding()
            }
        }
        .navigationBarHidden(true)
    }
}

// MARK: - MyTikTokShopPage: View for "My TikTok Shop" page
struct MyTikTokShopPage: View {
    var body: some View {
        Text("This is My TikTok Shop Page")
            .navigationTitle("My TikTok Shop")
    }
}

// MARK: - KushalsBirthdayShoppingPage: View for "Kushal's Birthday Shopping" page
struct KushalsBirthdayShoppingPage: View {
    var body: some View {
        Text("This is Kushal's Birthday Shopping Page")
            .navigationTitle("Kushal's Birthday Shopping")
    }
}

// MARK: - CreateNewShoppingPage: View for "Create New Shopping" page
struct CreateNewShoppingPage: View {
    var body: some View {
        Text("This is the Create New Shopping Page")
            .navigationTitle("Create New Shopping Page")
    }
}

// MARK: - Preview for DefaultShopPage
#Preview {
    DefaultShopPage()
}
