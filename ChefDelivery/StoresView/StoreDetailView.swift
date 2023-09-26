//
//  StoreDetailView.swift
//  ChefDelivery
//
//  Created by Luis Bandeira on 24/09/23.
//

import SwiftUI

struct StoreDetailView: View {
    
    let store: StoreType
    @Environment(\.presentationMode) var presentationMode
    
    @State private var selectedProduct: ProductType?
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, content: {
                Image(store.headerImage)
                    .resizable()
                    .scaledToFit()
                
                HStack {
                    Text(store.name)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold()
                    
                    Spacer()
                    
                    Image(store.logoImage)
                }
                .padding(.vertical, 8)
                .padding(.horizontal)
                
                HStack {
                    Text(store.location)
                    
                    Spacer()
                    
                    ForEach(1...store.stars, id: \.self) { _ in
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                            .font(.caption)
                    }
                }
                .padding(.vertical, 8)
                .padding(.horizontal)
                
                Text("Produtos")
                    .font(.title2)
                    .bold()
                    .padding()
                
                ForEach(store.products) { product in
                    Button(action: {
                        selectedProduct = product
                    }, label: {
                        HStack(spacing: 8) {
                            VStack(alignment: .leading, spacing: 8, content: {
                                Text(product.name)
                                    .bold()
                                
                                Text(product.description)
                                    .foregroundColor(.black)
                                    .opacity(0.5)
                                    .multilineTextAlignment(.leading)
                                
                                Text(product.formattedPrice)
                            })
                            
                            Spacer()
                            
                            Image(product.image)
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(12)
                                .frame(width: 120 ,height: 120)
                                .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.3), radius: 20,
                                        x: 6, y: 8
                                )
                        }
                        .padding(.horizontal)
                        .foregroundColor(.black)
                    })
                    .sheet(item: $selectedProduct) { product in
                        ProductDetailView(product: product)
                    }
                }
            })
            .navigationTitle(store.name)
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        HStack(spacing: 4) {
                            Image(systemName: "cart")
                            
                            Text("Lojas")
                        }
                        .foregroundColor(Color("ColorRed"))
                    }
                }
            }
        }
    }
}

struct StoreDetailView_previews: PreviewProvider {
    static var previews: some View {
        StoreDetailView(store: storesMock[0])
    }
}
