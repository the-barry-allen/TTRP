//
//  MessagesView.swift
//  tiktokRizzParty
//
//  Created by Simantak Dabhade on 1/7/24.
//

import SwiftUI

struct MessagesView: View {
    var body: some View {
        VStack{
            Text("Messages")
                .font(.largeTitle)
                .foregroundColor(.white)
                .background(Color.black.edgesIgnoringSafeArea(.all))
        }
        .containerRelativeFrame([.horizontal, .vertical])
        .background(.black)
    }
}

#Preview {
    MessagesView()
}
