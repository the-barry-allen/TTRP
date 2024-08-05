//
//  BirthdayPageView.swift
//  tiktokRizzParty
//
//  Created by Simantak Dabhade on 5/8/24.
//

import SwiftUI

// MARK: - BirthdayPageView: View for displaying the birthday page content
struct BirthdayPageView: View {
    var centre_offset: CGFloat
    @Binding var selectedTab: Int

    var body: some View {
        ZStack {
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

                    VStack(spacing: 12.0) {
                        // Navigation link to the friend's custom shopping page
                        NavigationLink(destination: LoadingView()) {
                            HStack {
                                Text("Lin Tao's B'day Page")
                                    .foregroundColor(.white)
                                    .font(.headline)
                                Image(systemName: "arrow.right")
                                    .foregroundColor(.white)
                                    .font(.headline)
                            }
                            .padding(.horizontal, 16)
                            .padding(.vertical, 10)
                            .background(Color.green)
                            .cornerRadius(20)
                            .shadow(color: Color.green.opacity(0.6), radius: 10, x: 0, y: 0) // Glow effect
                            .scaleEffect(1.1) // Make the button slightly larger
                        }

                        // Horizontal scroll view for product cards
                        ScrollView(.horizontal) {
                            HStack {
                                NavigationLink(destination: LoadingView()) {
                                    product_card_view(
                                        imageName: "product_2",
                                        titleDescription: "Argentina National Football Team Soccer Jersey",
                                        priceText: "38.99"
                                    )
                                }

                                NavigationLink(destination: LoadingView()) {
                                    product_card_view(
                                        imageName: "product_3",
                                        titleDescription: "Bellroy Venture Sling 9L Explorer bag",
                                        saleText: "Flash Sale ⚡️",
                                        priceText: "38.99"
                                    )
                                }

                                NavigationLink(destination: LoadingView()) {
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
                    .padding(.bottom, 140)
                }
            }
        }
    }
}

// MARK: - Preview
struct BirthdayPageView_Previews: PreviewProvider {
    static var previews: some View {
        BirthdayPageView(centre_offset: -170, selectedTab: .constant(0))
    }
}
