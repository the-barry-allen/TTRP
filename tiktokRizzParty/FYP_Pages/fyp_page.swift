//
//  fyp_page.swift
//  tiktokRizzParty
//
//  Created by Simantak Dabhade on 2/7/24.
//
import SwiftUI

// MARK: - FYPPage: View for displaying For You Page (FYP) content
struct FYPPage: View {
    var isBdayPage = false
    var centre_offset: CGFloat = -170
    @Binding var selectedTab: Int

    // Computed property to generate a random color
    var randomColor: Color {
        Color(red: Double.random(in: 0...1), green: Double.random(in: 0...1), blue: Double.random(in: 0...1))
    }

    var body: some View {
        ZStack {
            // Conditionally show the background based on `isBdayPage`
            if isBdayPage {
                // Birthday page background image
                Image("new_background")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .padding(.bottom, 50.0)

                // Semi-transparent overlay
                Color.black.edgesIgnoringSafeArea(.all).opacity(0.3)

                ZStack {
                    // Profile card view with a central offset
                    ProfileCardView(centre_offset: centre_offset)

                    VStack(alignment: .center) {
                        Spacer()

                        VStack {
                            // Navigation link to the shop view
                            NavigationLink(destination: ShopView()) {
                                HStack {
                                    Text("Shop for a B'day Gift")
                                        .foregroundColor(.white)
                                        .font(.headline)
                                    Image(systemName: "arrow.right")
                                        .foregroundColor(.white)
                                        .font(.headline)
                                }
                                .padding(.horizontal, 16)
                                .padding(.vertical, 8)
                                .background(Color.pink)
                                .cornerRadius(20)
                                .shadow(color: Color.pink.opacity(0.6), radius: 10, x: 0, y: 0) // Glow effect
                                .scaleEffect(1.1) // Make the button slightly larger
                            }

                            // Horizontal scroll view for product cards
                            ScrollView(.horizontal) {
                                HStack {
                                    NavigationLink(destination: ShopView()) {
                                        product_card_view(
                                            imageName: "product_2",
                                            titleDescription: "Argentina National Football Team Soccer Jersey",
                                            priceText: "38.99"
                                        )
                                    }

                                    NavigationLink(destination: ShopView()) {
                                        product_card_view(
                                            imageName: "product_3",
                                            titleDescription: "Bellroy Venture Sling 9L Explorer bag",
                                            saleText: "Flash Sale ⚡️",
                                            priceText: "38.99"
                                        )
                                    }

                                    NavigationLink(destination: ShopView()) {
                                        product_card_view(
                                            imageName: "product_1",
                                            titleDescription: "Adidas Predator Elite FG football boots",
                                            saleText: "Ad",
                                            priceText: "79.99"
                                        )
                                    }
                                }
                            }
                            .padding(.top, 4)
                            .scrollIndicators(.never)
                        }
                        .padding(.bottom, 130)
                    }
                }
            } else {
                // Random color background for non-birthday pages
                randomColor
                    .edgesIgnoringSafeArea(.all) // Extend the color to the edges of the screen

                // Text overlay for non-birthday pages
                Text("Sample Video, Scroll to the next video ⬇️")
                    .bold()
                    .shadow(color: .white, radius: 10)
            }
        }
    }
}

// MARK: - Preview
struct FYPPage_Previews: PreviewProvider {
    static var previews: some View {
        FYPPage(isBdayPage: false, selectedTab: .constant(0)) // Preview the non-birthday page
    }
}
