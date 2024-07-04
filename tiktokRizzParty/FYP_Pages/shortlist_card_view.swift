//
//  shortlist_card_view.swift
//  tiktokRizzParty
//
//  Created by Rahul Mallavarapu on 4/7/24.
//

import SwiftUI

struct shortlist_card_view: View {

    var imageName: String
    var likes: Int
    var priceText: String = "00.00"

    let cardWidth: CGFloat = 120
    let cardHeight: CGFloat = 154
    var body: some View {
        VStack(spacing: 0.0){
            VStack(alignment: .leading) {
                        Image(imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: cardWidth)
                            //.padding(.top, 12.0)
                HStack{
                    
                    Text("$\(priceText)")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.pink)
                        .padding(.horizontal, 6)
                        .padding(.vertical, 4)
                        .background(.thinMaterial)
                        .cornerRadius(4)
                        .padding([.bottom, .trailing], 5)
                    Spacer()
                    Text(String(likes))
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(.vertical, 4)
                    Image(systemName: "hand.thumbsup.fill")
                        .font(.caption)
                        .foregroundColor(.black)
                        .padding(.trailing, 6)
                        .padding(.vertical, 4)
                }
                    }.frame(width: cardWidth)

        }
        .background(.white)
        .frame(width: cardWidth)
        .frame(height: cardHeight)
        .cornerRadius(8.0)
        .padding(.horizontal, 2)
    }
}

#Preview {
    FYPPage(isBdayPage: true)
}
