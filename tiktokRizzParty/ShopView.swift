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
                        ShortlistView()
                        RecoItemsView(products: products)
                    }
                    //.padding()
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
            
            Text("KUSHAL'S SHOPPING LIST")
                .font(.system(size: 20))
                .bold()
                .cornerRadius(10)
//                .scaledToFit()
//                .minimumScaleFactor(0.01)
//                .lineLimit(1)
            Spacer()
            Button(action: {

                showDrawer.toggle()
            }, label: {
                HStack {

                    ZStack {
                        Image(systemName: "person.2")
                            .bold()
                            .font(.system(size: 20))

                        Image(systemName: "plus")
                            .bold()
                            .font(.system(size: 10))
                            .bold()
                            .padding(EdgeInsets(top: 20, leading: 30, bottom: 0, trailing: 0))// Smaller size for the plus

                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(Color.pink)
                .cornerRadius(20)
                .shadow(color: Color.pink.opacity(0.6), radius: 10, x: 0, y: 0) // Glow effect
                .scaleEffect(1.1) // Make the button slightly larger
            })
            .buttonStyle(PlainButtonStyle()) // Ensures the button keeps the custom style
            .animation(.easeInOut(duration: 0.2), value: 1.0) // Animation for smooth interaction



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

struct ShortlistView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Top Picks Section
            Text("Shortlisted Items")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.horizontal)
                .foregroundColor(.white)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(products, id: \.name) { product in
                        shortlist_card_view(imageName: product.item, likes: 5, priceText: product.price)
                    }
                }
            }
            //.cornerRadius(10)
        }
        .padding(.horizontal)
        .padding(.vertical, 12)
        .background(.thinMaterial.opacity(0.2))
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
        Text("Kushal Might Like")
            .font(.title)
            .fontWeight(.bold)
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
