//
//  BudgetPage.swift
//  tiktokRizzParty
//
//  Created by Simantak Dabhade on 8/8/24.
//

import SwiftUI

struct BudgetPage: View {

    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            Text("Budget Editor")
                .font(.title)
                .padding()

            Text("Here the user would be able to change the desired shopping budget for the group. You can set a contribution amount per person, or set a total budget. Recommendations on the other page are made to be within this budget.")
                .font(.headline)
                .padding()

            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                HStack{
                    Text("Back")
                        .font(.system(size: 18))
                        .padding(.leading, 2)
                        .padding(.trailing, 8)
                }
            }
        }
    }
}

#Preview {
    BudgetPage()
}
