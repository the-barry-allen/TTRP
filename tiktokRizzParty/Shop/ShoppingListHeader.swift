//
//  ShoppingListHeader.swift
//  tiktokRizzParty
//
//  Created by Simantak Dabhade on 7/7/24.
//

import SwiftUI

// MARK: - ShoppingListHeader: View for displaying the shopping list header
struct ShoppingListHeader: View {
    @State private var showDrawer = false
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        HStack {
            // Back button
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "chevron.left")
                    .font(.system(size: 20))
                    .padding(.leading, 4)
                    .padding(.trailing, 8)
            }

            // Title texts
            VStack(alignment: .leading) {
                Text("KUSHAL'S")
                    .fontWeight(.black)
                    .font(.system(size: 32))
                    .multilineTextAlignment(.leading)
                    .frame(width: 200, alignment: .leading) // Adjust the width as needed
                    .lineLimit(nil) // Allows unlimited lines for wrapping

                Text("BIRTHDAY SHOP")
                    .fontWeight(.black)
                    .font(.system(size: 24))
                    .multilineTextAlignment(.leading)
                    .frame(width: 200, alignment: .leading) // Adjust the width as needed
                    .lineLimit(nil) // Allows unlimited lines for wrapping
            }

            Spacer()

            // Friends button with badge
            Button(action: {
                showDrawer.toggle()
            }) {
                ZStack {
                    HStack {
                        ZStack {
                            Image(systemName: "person.2")
                                .bold()
                                .font(.system(size: 20))
                            Image(systemName: "plus")
                                .bold()
                                .font(.system(size: 10))
                                .padding(EdgeInsets(top: 20, leading: 30, bottom: 0, trailing: 0)) // Smaller size for the plus
                        }
                    }
                    .padding(.horizontal, 8)
                    .padding(.vertical, 8)
                    .background(Color.pink.opacity(0.5))
                    .cornerRadius(20)
                    .shadow(color: Color.pink.opacity(0.6), radius: 10, x: 0, y: 0) // Glow effect
                    .scaleEffect(1.0) // Make the button slightly larger

                    // Badge for the number of friends
                    Text("3")
                        .fontWeight(.bold)
                        .font(.caption)
                        .foregroundColor(.white)
                        .padding(5)
                        .background(Circle().fill(Color.green.opacity(0.6)))
                        .offset(x: 22, y: -20)
                }
            }
            .padding(.trailing, 16.0)
            .buttonStyle(PlainButtonStyle()) // Ensures the button keeps the custom style
            .animation(.easeInOut(duration: 0.2), value: 1.0) // Animation for smooth interaction
        }
        .foregroundColor(.white)
        .sheet(isPresented: $showDrawer) {
            FriendView()
        }
    }
}

// MARK: - Preview for ShoppingListHeader
#Preview {
    ZStack {
        Color.black
        ShoppingListHeader()
    }
}
