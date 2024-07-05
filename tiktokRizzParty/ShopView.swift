//
//  ShopView.swift
//  tiktokRizzParty
//
//  Created by Simantak Dabhade on 1/7/24.
//

import SwiftUI

struct Product {
    var name: String
    var item: String
    var price: String
}

let products = [
    Product(name: "Blue and White Sneakers", item: "ShopViewSampleProduct" , price: "69.99"),
    Product(name: "Blue and White Sneakers1", item: "ShopViewSampleProduct" , price: "69.99"),
    Product(name: "Blue and White Sneakers2", item: "ShopViewSampleProduct" , price: "69.99"),
    Product(name: "Blue and White Sneakers3", item: "ShopViewSampleProduct" , price: "69.99"),
   
    
]

struct ShopView: View {
    var body: some View {
            VStack (alignment: .leading) {
                ShoppingListHeader()
                ScrollView {
                    VStack(alignment: .leading) {
                        SearchBar()
                        FilterContainer()
                        TopPicksView()
                        RecoItemsView(products: products)
                    }
                    .padding()
                }
            }
            .background(.black)
    }
}

struct ShoppingListHeader: View {
    @State private var showDrawer = false
    var body: some View {
        HStack {
            Image(systemName: "chevron.left")
                .font(.system(size: 20))
            Spacer()
            Text("KUSHAL'S SHOPPING LIST")
                .font(.system(size: 20))
                .bold()
                .cornerRadius(10)
//                .scaledToFit()
//                .minimumScaleFactor(0.01)
//                .lineLimit(1)
            Spacer()
            ZStack {
                Image(systemName: "person.2")
                    .font(.system(size: 20))
                
                Image(systemName: "plus")
                    .font(.system(size: 10))
                    .bold()
                    .padding(EdgeInsets(top: 20, leading: 30, bottom: 0, trailing: 0))// Smaller size for the plus
                
            }
            .onTapGesture {
                showDrawer.toggle()
            }
        }
        .padding()
        .frame(height: 30)
        .foregroundColor(.white)
        .sheet(isPresented: $showDrawer) {
            FriendView()
        }
    }
}

struct SearchBar: View {
    @State private var searchText = ""
    
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
            TextField("Football", text: $searchText)
                .padding(10)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .foregroundColor(.gray)
            Spacer()
            Image(systemName: "slider.horizontal.3")
                            .foregroundColor(.gray)
            
        }
    }
}

struct TopPicksView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Top Picks Section
            Text("Shortlist")
                .font(.title)
                .padding(.horizontal)
                .foregroundColor(.white)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(products, id: \.name) { product in
                        shortlist_card_view(imageName: product.item, likes: 5, priceText: product.price)
                    }
                }
            }
            .cornerRadius(10)
        }
    }
}

struct ProductView: View {
    var imageName: String
    var price: String

    var body: some View {
        VStack (alignment: .leading) {
            Image(imageName)
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(10)
            Text(price)
                
        }
        .padding()
        .background(.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct RecoItemsView: View {
    let products: [Product]
    
    var body: some View {
        // Recommended Items Section
        Text("Recommended Items")
            .font(.title)
            .padding(.horizontal)
            .foregroundColor(.white)
    let adaptiveColumns = [
        GridItem(.adaptive(minimum: 170))
        ]

        LazyVGrid(columns: adaptiveColumns, spacing: 20) {
            ForEach(products, id: \.name) { product in
                product_card_view(imageName: product.item, titleDescription: product.name, priceText: product.price)
            }
        }
    }
}

struct RecommendedItemView: View {
    var imageName: String
    var title: String
    var price: String

    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .frame(width: 100, height: 100)
            Text(title)
                .font(.headline)
            Text(price)
                .font(.subheadline)
            Spacer()
            Button(action: {}) {
                Image(systemName: "cart")
                    .padding()
            }
        }
        .frame(height: 200)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

#Preview {
    ShopView()
}
