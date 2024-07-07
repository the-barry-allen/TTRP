//
//  product_card_view.swift
//  tiktokRizzParty
//
//  Created by Simantak Dabhade on 3/7/24.
//
import SwiftUI

// MARK: - ProductCardView: View for displaying a product card
struct product_card_view: View {
    var imageName: String
    var titleDescription: String
    var saleText: String = "SALE"
    var priceText: String = "00.00"

    let cardWidth: CGFloat = 190
    let cardHeight: CGFloat = 230

    var body: some View {
        VStack(spacing: 0.0) {
            // Image and price section
            ZStack(alignment: .bottomLeading) {
                // Product image
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: cardWidth, height: cardHeight * 0.75)
                    .clipped()
                    .cornerRadius(8)

                // Sale text and price overlay
                HStack {
                    // Sale text
                    Text(saleText)
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color.pink)
                        .cornerRadius(4)
                        .padding([.leading, .bottom], 5)

                    Spacer()

                    // Price text
                    Text("$\(priceText)")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.pink)
                        .padding(.horizontal, 6)
                        .padding(.vertical, 4)
                        .background(.thinMaterial)
                        .cornerRadius(4)
                        .padding([.bottom, .trailing], 5)
                }
            }
            .frame(width: cardWidth)

            // Title description section
            Text(titleDescription)
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundColor(.black)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
                .padding(.horizontal, 6)
                .padding(.top, 4)
                .frame(width: cardWidth - 12, alignment: .leading)

            Spacer()
        }
        .background(Color.white)
        .frame(width: cardWidth)
        .frame(height: cardHeight)
        .cornerRadius(8.0)
        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 4)
        .padding(.horizontal, 2)
    }
}

// MARK: - Preview for ProductCardView
struct product_card_view_Previews: PreviewProvider {
    static var previews: some View {
        product_card_view(
            imageName: "T-Shirt 1",
            titleDescription: "Full sleeved graphite shirt - pure cotton",
            priceText: "24.99"
        )
        .previewLayout(.sizeThatFits)
        .background(Color.gray)
    }
}
