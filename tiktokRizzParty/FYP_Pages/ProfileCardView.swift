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
            // Background title image
            Image("bday_title")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 360, height: 190)
                .offset(y: -140 + centre_offset)

            // Profile picture image
            Image("kushal_pic")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(.circle)
                .frame(width: 225)
                .offset(y: -20 + centre_offset)

            // Deadline text image
            Image("deadline_text")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 305, height: 190)
                .offset(y: 110 + centre_offset)
        }
    }
}

// MARK: - Preview for ProfileCardView
#Preview {
    FYPPage(isBdayPage: true, selectedTab: .constant(0))
}
