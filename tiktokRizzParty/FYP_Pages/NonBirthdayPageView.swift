//
//  NonBirthdayPageView.swift
//  tiktokRizzParty
//
//  Created by Simantak Dabhade on 5/8/24.
//

import SwiftUI

// MARK: - NonBirthdayPageView: View for displaying the non-birthday page content
struct NonBirthdayPageView: View {
    // Computed property to generate a random color
    var randomColor: Color {
        Color(red: Double.random(in: 0...1), green: Double.random(in: 0...1), blue: Double.random(in: 0...1))
    }

    var body: some View {
        ZStack {
            // Random color background for non-birthday pages
            randomColor
                .edgesIgnoringSafeArea(.all) // Extend the color to the edges of the screen

            // Text overlay for non-birthday pages
            Text("Sample Video, Scroll to the next video ⬇️")
                .bold()
                .shadow(color: .white, radius: 10)
        }
    }
}

// MARK: - Preview
struct NonBirthdayPageView_Previews: PreviewProvider {
    static var previews: some View {
        NonBirthdayPageView()
    }
}

