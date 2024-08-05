//
//  fyp_page.swift
//  tiktokRizzParty
//
//  Created by Simantak Dabhade on 2/7/24.
//

import SwiftUI

import SwiftUI

// MARK: - FYPPage: View for displaying For You Page (FYP) content
struct FYPPage: View {
    var isBdayPage = false
    var centre_offset: CGFloat = -170
    var videoT = ""
    @Binding var selectedTab: Int

    var body: some View {
        if isBdayPage {
            BirthdayPageView(centre_offset: centre_offset, selectedTab: $selectedTab)
        } else {
            NonBirthdayPageView(videoT: videoT)
        }
    }
}

// MARK: - Preview
struct FYPPage_Previews: PreviewProvider {
    static var previews: some View {
        FYPPage(isBdayPage: true, selectedTab: .constant(0)) // Preview the non-birthday page
    }
}
