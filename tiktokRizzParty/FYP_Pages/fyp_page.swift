//
//  fyp_page.swift
//  tiktokRizzParty
//
//  Created by Simantak Dabhade on 2/7/24.
//
import SwiftUI

struct FYPPage: View {
    var isBdayPage = false
    var center_offset: CGFloat = -36

    // Computed property to generate a random color
    var randomColor: Color {
        Color(red: Double.random(in: 0...1), green: Double.random(in: 0...1), blue: Double.random(in: 0...1))
    }

    var body: some View {
        ZStack {
            // Conditionally show the background based on `isBdayPage`
            if isBdayPage {

                Image("bday_background") // Ensure you have an image named "birthdayBackground" in your assets
                    .resizable()
                    .edgesIgnoringSafeArea(.all)

                VStack{
                    ZStack{
                        Image("bday_title")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 360, height: 190)
                            //.background(.pink)
                            .offset(y: -140 + center_offset)

                        Image("profile_pic")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(.circle)
                            .frame(width: 225)
                            .offset(y: -20 + center_offset)

                        Image("deadline_text")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 325, height: 200)
                            //.background(.pink)
                            .offset(y: 120 + center_offset)
                    }
                }
            } else {
                randomColor
                    .edgesIgnoringSafeArea(.all) // Extend the color to the edges of the screen
            }
        }
    }
}

// Preview
struct FYPPage_Previews: PreviewProvider {
    static var previews: some View {
        FYPPage(isBdayPage: true) // Preview the birthday page
    }
}
