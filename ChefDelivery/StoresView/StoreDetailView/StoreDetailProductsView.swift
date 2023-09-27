//
//  StoreDetailProductsView.swift
//  ChefDelivery
//
//  Created by Luis Bandeira on 27/09/23.
//

import SwiftUI

struct StoreDetailProductsView: View {
    
    let store: StoreType
    
    @State private var selectedProduct: ProductType?
    
    var body: some View {
        VStack {
            HStack {
                Text("Produtos")
                    .font(.title2)
                    .bold()
                    .padding()
                
                Spacer()
            }
            
            ForEach(store.products) { product in
                Button(action: {
                    selectedProduct = product
                }, label: {
                    StoreDetailProductItemView(product: product)
                })
                .sheet(item: $selectedProduct) { product in
                    ProductDetailView(product: product)
                }
            }
        }
    }
}

struct StoreDetailProducts_Previews: PreviewProvider {
    static var previews: some View {
        StoreDetailProductsView(store: storesMock[0])
    }
}
