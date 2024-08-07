//
//  Friend_Page.swift
//  tiktokRizzParty
//
//  Created by Rahul Mallavarapu on 5/7/24.
//
import SwiftUI

// MARK: - FriendTile: Model for a friend tile
struct FriendTile: Identifiable, Codable {
    let id = UUID()
    var icon: String
    var name: String
    var isSelected: Bool = false
}

// MARK: - FriendView: View for displaying friends and shareable link
struct FriendView: View {
    @State private var friends: [FriendTile] = loadFriends()
    @State private var dummyLink: String = "https://tiktok.link/share"
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    HStack{
                        Image(systemName: "chevron.left")
                            .font(.system(size: 18))
                            .padding(.leading, 4)
                        Text("Back")
                            .font(.system(size: 18))
                            .padding(.leading, 2)
                            .padding(.trailing, 8)
                    }
                }
                Spacer()
            }
            // Shareable Link Section
            VStack {
                Text("Shareable Link")
                    .foregroundStyle(.white)
                    .fontWeight(.black)
                    .font(.system(size: 32))
                    .multilineTextAlignment(.leading)

                HStack {
                    Text(dummyLink)
                        .foregroundColor(.white)
                        .padding(8)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)

                    Button(action: {
                        UIPasteboard.general.string = dummyLink
                    }) {
                        Text("Copy Link")
                            .foregroundColor(.blue)
                            .padding(8)
                            .background(Color.white)
                            .cornerRadius(8)
                    }
                }
                .padding(.top, 10)
            }
            .padding()
            .background(Color.gray.opacity(0.4))
            .cornerRadius(10)
            .padding(.top)

            // Send link to section
            Text("Send link to...")
                .font(.title2)
                .bold()
                .foregroundColor(.white)
                .padding(.top, 20)

            ScrollView {
                ForEach(friends) { friend in
                    FriendTileView(friend: friend, onSelect: toggleSelection)
                        .cornerRadius(10)
                        .padding(.bottom, 2)
                }
            }
        }
        .padding()
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }

    // Toggle selection state for a friend
    private func toggleSelection(for friend: FriendTile) {
        if let index = friends.firstIndex(where: { $0.id == friend.id }) {
            friends[index].isSelected.toggle()
            friends.sort { $0.isSelected && !$1.isSelected }
            saveFriends(friends)
        }
    }

    // Load friends from UserDefaults or provide default friends
    private static func loadFriends() -> [FriendTile] {
        if let data = UserDefaults.standard.data(forKey: "friends"),
           let savedFriends = try? JSONDecoder().decode([FriendTile].self, from: data) {
            return savedFriends
        } else {
            return [
                FriendTile(icon: "person", name: "Clement"),
                FriendTile(icon: "person", name: "Wayne"),
                FriendTile(icon: "person", name: "Rahul"),
                FriendTile(icon: "person", name: "Kushal"),
                FriendTile(icon: "person", name: "Simantak"),
                FriendTile(icon: "person", name: "Kai Xin"),
                FriendTile(icon: "person", name: "Aaron")
            ]
        }
    }

    // Save friends to UserDefaults
    private func saveFriends(_ friends: [FriendTile]) {
        if let data = try? JSONEncoder().encode(friends) {
            UserDefaults.standard.set(data, forKey: "friends")
        }
    }
}

// MARK: - FriendTileView: View for displaying an individual friend tile
struct FriendTileView: View {
    var friend: FriendTile
    var onSelect: (FriendTile) -> Void

    var body: some View {
        HStack {
            Image(systemName: friend.icon)
                .foregroundColor(.white)
            Text(friend.name)
                .foregroundColor(.white)
            Spacer()
            Button(action: {
                onSelect(friend)
            }) {
                Text("Send Invite")
                    .foregroundColor(.blue)
                    .padding(8)
                    .background(Color.white)
                    .cornerRadius(8)
            }
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
        .onTapGesture {
            onSelect(friend)
        }
    }
}

// MARK: - Preview for FriendView
struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendView()
    }
}
