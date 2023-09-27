//
//  ProductDetailQuantityView.swift
//  ChefDelivery
//
//  Created by Luis Bandeira on 27/09/23.
//

import SwiftUI

struct ProductDetailQuantityView: View {
    
    @Binding var productQuantity: Int

    var body: some View {
        VStack(spacing: 16) {
            Text("Quantidade")
                .font(.title3)
                .bold()
            
            HStack {
                Button(action: {
                    if (productQuantity > 1) {
                        productQuantity -= 1
                    }
                }) {
                    Image(systemName: "minus.circle.fill")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold()
                }
                
                Text("\(productQuantity)")
                    .font(.title2)
                    .bold()
                
                Button(action: {productQuantity += 1}) {
                    Image(systemName: "plus.circle.fill")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold()
                }
            }
        }
    }
}

struct ProductDetailQuantityView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailQuantityView(productQuantity: .constant(1))
    }
}
