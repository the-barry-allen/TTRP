//
//  Home.page.swift
//  tiktokRizzParty
//
//  Created by Simantak Dabhade on 28/6/24.
//

import SwiftUI

struct Home_page: View {
    @State var counter_val: Int = 1

    var body: some View {
        VStack{
            Text("counter = \(counter_val)")
                .bold()
                .padding()
                .background(.pink)

            Button(action: {
                counter_val += 1
            }, label: {
                Text("Button")
            })
        }
    }
}

#Preview {
    Home_page()
}
