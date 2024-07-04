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
                        TabberView()
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
        }
        .padding()
        .frame(height: 30)
        .foregroundColor(.white)
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

struct TabberView: View {
    var body: some View {
        VStack {
            // Scrollable View with Page Indicators
            TabView {
                BrowseListContainer()
                CollaborationCardView()
                // Add more views here if needed
            }
            .tabViewStyle(PageTabViewStyle())
            .frame(height: 200) // Adjust the height as needed
        }
    }
}

struct CollaborationCardView: View {
    var body: some View {
        VStack{
            HStack {
                Text("Collaboration Made Easy")
                    .font(.system(size: 20))
                    .bold()
                    .padding()
                Spacer()
                ZStack {
                    Image(systemName: "person.2")
                        .font(.system(size: 20))
                    
                    Image(systemName: "plus")
                        .font(.system(size: 10))
                        .bold()
                        .padding(EdgeInsets(top: 20, leading: 30, bottom: 0, trailing: 0))// Smaller size for the plus
                    
                }
                    .frame(width: 100, height: 50)
                    .background(Color(.systemGray4))
                    .cornerRadius(10)
                    .padding()
            }
            Text("Add friends to shop on the same list, so everyone is on the same page!")
                .font(.system(size: 15))
                .padding(EdgeInsets(top: 0, leading: 5, bottom: 5, trailing: 5))
        }
        .frame(height: 180)
        .background(.gray)
        .cornerRadius(10)
        .padding()
    }
}
struct BrowseListContainer: View {
    var body: some View {
        VStack{
            HStack {
                Text("Browse shortlisted items")
                    .font(.system(size: 20))
                    .bold()
                    .padding()
                Spacer()
                Text("Go to list")
                    .frame(width: 100, height: 50)
                    .background(Color(.systemGray4))
                    .cornerRadius(10)
                    .padding()
            }
            Text("Need inspiration on what to buy? Take a look at what others have shortlisted!")
                .font(.system(size: 15))
                .padding(EdgeInsets(top: 0, leading: 5, bottom: 5, trailing: 5))
        }
        .frame(height: 180)
        .background(.gray)
        .cornerRadius(10)
        .padding()
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
