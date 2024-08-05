//
//  LoadingView.swift
//  tiktokRizzParty
//
//  Created by Simantak Dabhade on 5/8/24.
//

import SwiftUI

// MARK: - LoadingView: View for displaying the loading animation
struct LoadingView: View {
    @State private var isLoading = true
    @State private var progress: Double = 0.0

    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)

            if isLoading {
                VStack {
                    // Simulate communication with TikTok servers
                    Text("Creating custom B'day page for Lin Tao...")
                        .foregroundColor(.white)
                        .padding(.bottom, 1)

                    // Linear loading bar
                    ProgressView(value: progress, total: 100)
                        .progressViewStyle(LinearProgressViewStyle(tint: .pink))
                        .padding()
                        .frame(width: 300)
                }
                .onAppear {
                    // Simulate loading progress
                    Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
                        if self.progress < 100 {
                            self.progress += 2
                        } else {
                            timer.invalidate()
                            self.isLoading = false
                        }
                    }
                }
            } else {
                ShopView()
            }
        }
    }
}

// MARK: - Preview
struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
