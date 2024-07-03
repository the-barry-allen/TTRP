//
//  fyp_page.swift
//  tiktokRizzParty
//
//  Created by Simantak Dabhade on 2/7/24.
//
import SwiftUI

struct FYPPage: View {
    var isBdayPage = false
    var center_offset: CGFloat = -170

    // Computed property to generate a random color
    var randomColor: Color {
        Color(red: Double.random(in: 0...1), green: Double.random(in: 0...1), blue: Double.random(in: 0...1))
    }

    var body: some View {
        ZStack {
            // Conditionally show the background based on `isBdayPage`
            if isBdayPage {

                Image("new_background") // Ensure you have an image named "birthdayBackground" in your assets
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .padding(.bottom, 50.0)

                ZStack{
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

                    VStack{
                        Spacer()
                        VStack{

                            ScrollView(.horizontal) {
                                HStack{
                                    product_card_view(
                                        imageName: "product_2",
                                        titleDescription: "Argentina National Football Team Soccer Jersey",
                                        priceText: "38.99")

                                    product_card_view(
                                        imageName: "product_3",
                                        titleDescription: "Bellroy Venture Sling 9L Explorer bag",
                                        saleText: "Flash Sale ⚡️",

                                        priceText: "38.99")

                                    product_card_view(
                                        imageName: "product_1",
                                        titleDescription: "Adidas Predator Elite FG football boots",
                                        saleText: "Ad",
                                        priceText: "79.99")
                                }
                            }
                            .scrollIndicators(.never)
                    }
                    .padding(.top, 40.0)
                    .padding(.bottom, 100)
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
