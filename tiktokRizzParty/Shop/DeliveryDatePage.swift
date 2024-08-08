//
//  DeliveryDatePafe.swift
//  tiktokRizzParty
//
//  Created by Simantak Dabhade on 8/8/24.
//

import SwiftUI

struct DeliveryDatePage: View {

    @Environment(\.presentationMode) var presentationMode

    
    var body: some View {
        VStack {
            Text("Delivery Date Editor")
                .font(.title)
                .padding()

            Text("Here the user would be able to edit their desired delivery date, however the default is set to the recipient's birthday that we know of! Recommendations made will check to make sure delivery can be made by this date.")
                .font(.headline)
                .padding()

            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                HStack{

                    Text("Back")
                        .font(.system(size: 18))
                        .bold()
                        .padding(.leading, 2)
                        .padding(.trailing, 8)
                }
            }
        }
    }
}

#Preview {
    DeliveryDatePage()
}
