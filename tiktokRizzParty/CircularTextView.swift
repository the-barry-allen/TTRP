//
//  CircularTextView.swift
//  tiktokRizzParty
//
//  Created by Simantak Dabhade on 5/8/24.
//

import SwiftUI

// A view that arranges text in a circular layout
struct CircularTextView: View {
    // State variable to store the widths of each letter
    @State var letterWidths: [Int:Double] = [:]
    // State variable to store the title
    @State var title: String

    // Constants for letter spacing and dimensions of the view
    let letterSpacing: CGFloat = 7
    var width: CGFloat
    var height: CGFloat
    var radius: Double
    var fontSize: CGFloat = 25

    // Computed property to get the title as an array of enumerated characters
    var lettersOffset: [(offset: Int, element: Character)] {
        return Array(title.enumerated())
    }

    var body: some View {
        ZStack {
            // Iterate over each letter in the title
            ForEach(lettersOffset, id: \.offset) { index, letter in // Mark 1
                VStack {
                    Text(String(letter))
                        .font(.system(size: 25, design: .monospaced))
                        .fontWeight(.black)
                        .foregroundColor(.white)
                        .kerning(letterSpacing) // Adjust letter spacing
                        .background(LetterWidthSize()) // Mark 2
                        // Update the width of the letter when it changes
                        .onPreferenceChange(WidthLetterPreferenceKey.self, perform: { width in  // Mark 2
                            letterWidths[index] = width
                        })
                    Spacer() // Push the letter away from the center
                }
                // Rotate each letter to its correct angle
                .rotationEffect(fetchAngle(at: index)) // Mark 3
            }
        }
        .frame(width: width, height: height)
        // Automatically center the text at the top
        .rotationEffect(calculateRotationOffset())
    }

    // Function to calculate the angle for each letter
    func fetchAngle(at letterPosition: Int) -> Angle {
        let times2pi: (Double) -> Double = { $0 * 2 * .pi }

        // Calculate the circumference of the circle
        let circumference = times2pi(radius)

        // Calculate the final angle for the letter based on its width
        let finalAngle = times2pi(letterWidths.filter{$0.key <= letterPosition}.map(\.value).reduce(0, +) / circumference)

        return .radians(finalAngle)
    }

    // Function to calculate the rotation offset to center the text at the top
    func calculateRotationOffset() -> Angle {
        // Calculate the total width of all letters
        let totalWidth = letterWidths.values.reduce(0, +)
        // Calculate the total angle of the text
        let totalAngle = (totalWidth / (2 * .pi * radius)) * 360
        // Return the angle to center the text
        return .degrees(-totalAngle / 2)
    }
}

// Preference key to store the width of each letter
struct WidthLetterPreferenceKey: PreferenceKey {
    static var defaultValue: Double = 0
    static func reduce(value: inout Double, nextValue: () -> Double) {
        value = nextValue()
    }
}

// View to get the width of each letter
struct LetterWidthSize: View {
    var body: some View {
        GeometryReader { geometry in // Using GeometryReader to get the width of each letter
            Color
                .clear
                .preference(key: WidthLetterPreferenceKey.self,
                            value: geometry.size.width)
        }
    }
}

// Preview for the CircularTextView
struct MA_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.black
            CircularTextView(title: "Lin Tao's B'day",
                             width: 250,
                             height: 250,
                             radius: 145)

        }
    }
}
