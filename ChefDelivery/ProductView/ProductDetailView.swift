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
            VStack(alignment: .leading, spacing: 16, content: {
                Image(product.image)
                    .resizable()
                    .scaledToFit()
                    .shadow(radius: 20)
                
                Text(product.name)
                    .font(.title)
                    .bold()
                    .padding(.horizontal)
                    .padding(.top)
                
                Text(product.description)
                    .padding(.horizontal)
                
                Text(product.formattedPrice)
                    .font(.title3)
                    .bold()
                    .padding(.horizontal)
            })
            
            Spacer()
            
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
            
            Spacer()
            
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
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product: storesMock[0].products[0])
    }
}
