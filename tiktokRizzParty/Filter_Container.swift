//
//  Filter_Container.swift
//  tiktokRizzParty
//
//  Created by Rahul Mallavarapu on 5/7/24.
//
import SwiftUI

struct FilterContainer: View {
    
    let items = [
        ("Delivery Date", "calendar"),
        ("Delivery Location", "map.fill"),
        ("Budget", "dollarsign.circle.fill"),
    ]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(items, id: \.0) { item in
                    VStack {
                        Image(systemName: item.1)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .foregroundColor(.white)
                        Text(item.0)
                            .font(.caption)
                    }
                }
            }
        }
        .padding(EdgeInsets(top: 20, leading: 5, bottom: 0, trailing: 5))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
