//
//  ProductDetailView.swift
//  ChefDelivery
//
//  Created by Luis Bandeira on 25/09/23.
//

import SwiftUI

struct ProductDetailView: View {
    
    let product: ProductType
    @State var productQuantity = 1
    
    var body: some View {
        VStack {
            ProductDetailHeaderView(product: product)
            
            Spacer()
            
            ProductDetailQuantityView(productQuantity: $productQuantity)
            
            Spacer()
            
            ProductDetailButtonView()
        }
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product: storesMock[0].products[0])
    }
}

struct ProductDetailButtonView: View {
    var body: some View {
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
            HStack {
                Image(systemName: "cart")
                Text("Adicionar ao carrinho")
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 16)
            .font(.title3)
            .bold()
            .background(Color("ColorRed"))
            .foregroundColor(.white)
            .cornerRadius(32)
            .shadow(
                color: Color("ColorRedDark").opacity(0.5),
                radius: 10,
                x: 6,
                y: 8
            )
        })
    }
}
