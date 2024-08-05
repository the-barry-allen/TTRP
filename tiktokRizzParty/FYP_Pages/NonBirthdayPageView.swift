//
//  NonBirthdayPageView.swift
//  tiktokRizzParty
//
//  Created by Simantak Dabhade on 5/8/24.
//

import SwiftUI
import AVKit

// MARK: - FYPPage: View for displaying For You Page (FYP) content
struct NonBirthdayPageView: View {
    var videoT = ""
    var videoExt = "mov"
    var centre_offset: CGFloat = -170

    @State private var player: AVPlayer?
    @State private var isVisible: Bool = false

    // Computed property to generate a random color
    var randomColor: Color {
        Color(red: Double.random(in: 0...1), green: Double.random(in: 0...1), blue: Double.random(in: 0...1))
    }

    var body: some View {
        ZStack {
            
                if let player = player {
                    VideoPlayer(player: player)
                        .onAppear {
                            player.seek(to: .zero)
                            player.play()
                            NotificationCenter.default.addObserver(
                                forName: .AVPlayerItemDidPlayToEndTime,
                                object: player.currentItem,
                                queue: .main
                            ) { _ in
                                player.seek(to: .zero)
                                player.play()
                            }
                        }
                        .onDisappear {
                            player.pause()
                        }
                        .background(GeometryReader { geometry in
                            Color.clear.onAppear {
                                if geometry.frame(in: .global).intersects(UIScreen.main.bounds) {
                                    player.play()
                                } else {
                                    player.pause()
                                }
                            }
                            .onChange(of: geometry.frame(in: .global)) { newValue in
                                if newValue.intersects(UIScreen.main.bounds) {
                                    player.play()
                                } else {
                                    player.pause()
                                }
                            }
                        })
                        .edgesIgnoringSafeArea(.all) // Extend the video to the edges of the screen
                }
            
        }
        .onAppear {
                if let url = Bundle.main.url(forResource: videoT, withExtension: videoExt) {
                    player = AVPlayer(url: url)
                } else {
                    print("Video file not found: \(videoT).\(videoExt)")
                }
        }
    }
}

// MARK: - Preview
struct NonBirthdayPageView_Previews: PreviewProvider {
    static var previews: some View {
        NonBirthdayPageView(videoT: "random2", videoExt: "mov") // Preview the non-birthday page
    }
}
