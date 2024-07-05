//
//  product_card_view.swift
//  tiktokRizzParty
//
//  Created by Simantak Dabhade on 3/7/24.
//

import SwiftUI

struct product_card_view: View {

    var imageName: String
    var titleDescription: String
    var saleText: String = "SALE"
    var priceText: String = "00.00"

    let cardWidth: CGFloat = 180
    let cardHeight: CGFloat = 230
    var body: some View {
        VStack(spacing: 0.0){
            ZStack(alignment: .bottomLeading) {
                        Image(imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: cardWidth)
                            //.padding(.top, 12.0)
                HStack{
                    Text(saleText)
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color.pink)
                        .cornerRadius(4)
                        .padding([.leading, .bottom], 5) // Adjust padding to position the label

                    Spacer()

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
                    }.frame(width: cardWidth)
            Spacer()
            HStack{
                Text(titleDescription)
                    .font(.caption)
                    .foregroundStyle(.black)
                    .padding(.horizontal, 3.0)
                    .padding(.leading, 3.0)
                Spacer()
            }.frame(height: cardHeight*0.2)
            Spacer()
        }
        .background(.white)
        .frame(width: cardWidth)
        .frame(height: cardHeight)
        .cornerRadius(8.0)
        .padding(.horizontal, 2)
    }
}

#Preview {
    FYPPage(isBdayPage: true, selectedTab: .constant(0))
}
