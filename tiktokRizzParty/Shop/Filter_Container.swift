//
//  Filter_Container.swift
//  tiktokRizzParty
//
//  Created by Rahul Mallavarapu on 5/7/24.
//
import SwiftUI

// MARK: - FilterContainer: View for displaying filter options
struct FilterContainer: View {
    @State private var showDeliveryDateInfo = false
    @State private var showBudgetInfo = false

    var body: some View {
        HStack(alignment: .center, spacing: 14.0) {
            // Delivery date filter card
            FilterCard(
                imageName: "calendar",
                title: "24th July",
                subtitle: "Delivery Date",
                badgeName: "square.and.pencil"
            ).onTapGesture {
                showDeliveryDateInfo.toggle()
            }

            // Budget filter card
            FilterCard(
                imageName: "basket.fill",
                title: "SGD $60",
                subtitle: "Budget (3 pax)",
                badgeName: "square.and.pencil"
            ).onTapGesture {
                showBudgetInfo.toggle()
            }
        }
        .padding(.horizontal, 20) // Add padding to the sides
        .frame(maxWidth: .infinity, alignment: .center) // Center the HStack
        .sheet(isPresented: $showDeliveryDateInfo) {
            VStack {
                Text("Delivery Date Editor")
                    .font(.title)
                    .padding()

                Text("Here the user would be able to edit their desired delivery date, however the default is set to the recipient's birthday that we know of! Recommendations made will check to make sure delivery can be made by this date.")
                    .font(.headline)
                    .padding()
            }
        }
        .sheet(isPresented: $showBudgetInfo) {
            VStack {
                Text("Budget Editor")
                    .font(.title)
                    .padding()

                Text("Here the user would be able to change the desired shopping budget for the group. You can set a contribution amount per person, or set a total budget. Recommendations on the other page are made to be within this budget.")
                    .font(.headline)
                    .padding()
            }
        }
    }
}

// MARK: - FilterCard: View for displaying an individual filter card
struct FilterCard: View {
    let imageName: String
    let title: String
    let subtitle: String
    let badgeName: String

    var body: some View {
        ZStack(alignment: .topTrailing) {
            HStack(alignment: .center, spacing: 10) {
                // Filter icon
                Image(systemName: imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                    .foregroundColor(.white)

                // Filter title and subtitle
                VStack(alignment: .leading, spacing: 2) {
                    Text(title)
                        .fontWeight(.bold)
                        .font(.title2)
                        .foregroundColor(.white)

                    Text(subtitle)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            .padding()
            .background(Color.secondary)
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.8), radius: 10, x: 0, y: 0)

            // Badge icon
            Image(systemName: badgeName)
                .fontWeight(.bold)
                .font(.system(size: 14))
                .foregroundColor(.white)
                .padding(5)
                .background(Circle().fill(Color.gray))
                .offset(x: 10, y: -10)
        }
        .padding(.top, 10)
        .padding(.trailing, 2)
    }
}

// MARK: - Preview for FilterContainer
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
