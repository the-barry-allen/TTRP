//
//  ShortlistView.swift
//  tiktokRizzParty
//
//  Created by Simantak Dabhade on 7/7/24.
//

import SwiftUI

// MARK: - ShortlistView: View for displaying shortlisted items
struct ShortlistView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0.0) {
            // Shortlisted Items Section
            Text("Shortlisted Items")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.horizontal)
                .foregroundColor(.white)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 3) {
                    // Padding on the left side
                    Color.clear.frame(width: 8)

                    // List of shortlisted products
                    ForEach(Array([products[2], products[6], products[8]].enumerated()), id: \.element.name) { index, product in
                        shortlist_card_view(imageName: product.item, likes: 4 - index, priceText: product.price)
                    }

                    // Padding on the right side
                    Color.clear.frame(width: 8)
                }
            }
        }
        .padding(.vertical, 12)
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color(red: 0.6, green: 0.0, blue: 0.6), Color(red: 0.0, green: 0.5, blue: 1.0)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.8), radius: 10, x: 0, y: 0)
    }
}

// MARK: - Preview for ShortlistView
#Preview {
    ShopView()
}
