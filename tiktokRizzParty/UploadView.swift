//
//  UploadView.swift
//  tiktokRizzParty
//
//  Created by Simantak Dabhade on 1/7/24.
//

import SwiftUI

struct UploadView: View {
    var body: some View {
        VStack{
            Text("Upload")
                .font(.largeTitle)
                .foregroundColor(.white)
                .background(Color.black.edgesIgnoringSafeArea(.all))
        }
        .containerRelativeFrame([.horizontal, .vertical])
        .background(.black)
    }
}

#Preview {
    UploadView()
}
