//
//  shortlist_card_view.swift
//  tiktokRizzParty
//
//  Created by Rahul Mallavarapu on 4/7/24.
//
import SwiftUI

// MARK: - ShortlistCardView: View for displaying a shortlisted product card
struct shortlist_card_view: View {
    var imageName: String
    var likes: Int
    var priceText: String = "00.00"

    let cardWidth: CGFloat = 120
    let cardHeight: CGFloat = 154

    var body: some View {
        VStack(spacing: 0.0) {
            VStack(alignment: .leading) {
                // Product image with overlay gradient border
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: cardWidth, height: cardWidth * 0.75)
                    .clipped()
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(LinearGradient(
                                gradient: Gradient(colors: [Color(red: 0.0, green: 0.75, blue: 1.0), Color(red: 1.0, green: 0.0, blue: 0.5)]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ), lineWidth: 2)
                    )

                // Price and likes section
                HStack(alignment: .center, spacing: 0) {
                    // Price text
                    Text("$\(priceText)")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.horizontal, 6)
                        .padding(.vertical, 4)
                        .background(Color.black.opacity(0.7))
                        .cornerRadius(4)
                        .padding([.bottom], 5)

                    Spacer()

                    // Likes text and icon
                    HStack(spacing: 4) {
                        Text(String(likes))
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.white)

                        Image(systemName: "hand.thumbsup.fill")
                            .font(.caption)
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal, 6)
                    .padding(.vertical, 4)
                    .background(Color.black.opacity(0.7))
                    .cornerRadius(4)
                    .padding(.bottom, 5)
                }
                .padding(.horizontal, 4)
            }
            .frame(width: cardWidth)
        }
        .background(Color.black)
        .cornerRadius(10.0)
        .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 5)
        .frame(width: cardWidth, height: cardHeight)
        .padding(.horizontal, 2)
    }
}

// MARK: - Preview for ShortlistCardView
struct shortlist_card_view_Previews: PreviewProvider {
    static var previews: some View {
        shortlist_card_view(imageName: "T-Shirt 1", likes: 150, priceText: "24.99")
            .previewLayout(.sizeThatFits)
            .background(Color.gray)
    }
}
