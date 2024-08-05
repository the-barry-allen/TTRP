//
//  ProfileCardView.swift
//  tiktokRizzParty
//
//  Created by Simantak Dabhade on 5/7/24.
//
import SwiftUI

// MARK: - ProfileCardView: View for displaying a profile card with images
struct ProfileCardView: View {
    var centre_offset: CGFloat

    var body: some View {
        ZStack {

            // Profile picture image
            Image("LinTaoProfilePic")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(.circle)
                .frame(width: 200)
                .offset(y: -35 + centre_offset)



            CircularTextView(title: "🎉 Lin Tao's B'day 🎁",
                             width: 295,
                             height: 295,
                             radius: 160,
                             fontSize: 35
            ).offset(y: -30 + centre_offset)

            VStack{
                Text("August 24th")
                    .font(.title)
                    .bold()
                    .foregroundStyle(.white)
                    .shadow(color: .pink, radius: 20)

                Text("in 15 days!")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.pink)
                    .shadow(color: .cyan, radius: 20)

            }
            .offset(y: 110 + centre_offset)

        }
    }
}

// MARK: - Preview for ProfileCardView
#Preview {
    FYPPage(isBdayPage: true, selectedTab: .constant(0))
}
