//
//  StoreItemView.swift
//  ChefDelivery
//
//  Created by Luis Bandeira on 23/09/23.
//

import SwiftUI

struct StoreItemView: View {
    let order: OrderType
    
    var body: some View {
        HStack {
            Image(order.image)
                .resizable()
                .scaledToFit()
                .cornerRadius(25)
                .frame(width: 50, height: 50)
            
            VStack {
                Text(order.name)
                    .font(.subheadline)
            }
            
            Spacer()
        }
    }
}

struct StoreItemView_previews: PreviewProvider {
    static var previews: some View {
        StoreItemView(order: OrderType(
            id: 1,
            name: "Monstro Burguer",
            image: "monstro-burger-logo"
        ))
    }
}
