//
//  Friend_Page.swift
//  tiktokRizzParty
//
//  Created by Rahul Mallavarapu on 5/7/24.
//

import SwiftUI

struct FriendTile: Identifiable, Codable {
    let id = UUID()
    var icon: String
    var name: String
    var isSelected: Bool = false
}

struct FriendView: View {
    @State private var friends: [FriendTile] = loadFriends()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Spacer()
                Text("Collaborate with People")
                    .font(.title)
                    .bold()
                    .padding()
                Spacer()
            }
            ForEach(friends) { friend in
                FriendTileView(friend: friend, onSelect: toggleSelection)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
    
    private func toggleSelection(for friend: FriendTile) {
        if let index = friends.firstIndex(where: { $0.id == friend.id }) {
            friends[index].isSelected.toggle()
            friends.sort { $0.isSelected && !$1.isSelected }
            saveFriends(friends)
        }
    }
    
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
    
    private func saveFriends(_ friends: [FriendTile]) {
        if let data = try? JSONEncoder().encode(friends) {
            UserDefaults.standard.set(data, forKey: "friends")
        }
    }
}

struct FriendTileView: View {
    var friend: FriendTile
    var onSelect: (FriendTile) -> Void
    
    var body: some View {
        HStack {
            Image(systemName: friend.icon)
            Text(friend.name)
            Spacer()
            if friend.isSelected {
                Image(systemName: "circle.fill")
                    .onTapGesture {
                        onSelect(friend)
                    }
            } else {
                Image(systemName: "circle")
                    .onTapGesture {
                        onSelect(friend)
                    }
            }
        }
        .padding()
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendView()
    }
}
