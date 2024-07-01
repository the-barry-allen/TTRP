//
//  ShopView.swift
//  tiktokRizzParty
//
//  Created by Simantak Dabhade on 1/7/24.
//

import SwiftUI

struct ShopView: View {
    var body: some View {
        NavigationView {
            VStack (alignment: .leading) {
                ShoppingListHeader()
                ScrollView {
                    VStack(alignment: .leading) {
                        SearchBar()
                        BrowseListContainer()
                        CategoryGrid(products: products)
                    }
                    .padding()
                }
            }
        }
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
            Spacer()
            Image(systemName: "slider.horizontal.3")
                            .foregroundColor(.gray)
            
        }
    }
}

struct BrowseListContainer: View {
    var body: some View {
        VStack{
            HStack {
                Text("Browse shortlisted items")
                    .font(.system(size: 23))
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
        .background(Color(.systemGray6))
        .cornerRadius(10)
    }
}

struct Product {
    var name: String
    var item: String
    var price: String
}

let products = [
    Product(name: "Blue and White Sneakers NEW", item: "ShopViewSampleProduct" , price: "$69.99"),
]


struct CategoryGrid: View {
    let products: [Product]
    
    var body: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
            ForEach(products, id: \.name) { product in
                VStack {
                    Image(product.item)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 200)
                    Text(product.name)
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


#Preview {
    ShopView()
}
