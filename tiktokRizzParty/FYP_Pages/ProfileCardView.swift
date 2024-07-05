//
//  ProfileCardView.swift
//  tiktokRizzParty
//
//  Created by Simantak Dabhade on 5/7/24.
//

import SwiftUI

struct ProfileCardView: View {
    var centre_offset: CGFloat

    var body: some View {
        ZStack{
            Image("bday_title")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 360, height: 190)
                .offset(y: -140 + centre_offset)

            Image("profile_pic")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(.circle)
                .frame(width: 225)
                .offset(y: -20 + centre_offset)

            Image("deadline_text")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 305, height: 190)
                //.background(.pink)
                .offset(y: 110 + centre_offset)
        }
    }
}

#Preview {
    FYPPage(isBdayPage: true, selectedTab: .constant(0))
}
