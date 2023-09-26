//
//  StoreItemView.swift
//  ChefDelivery
//
//  Created by Luis Bandeira on 23/09/23.
//

import SwiftUI

struct StoreItemView: View {
    let store: StoreType
    
    var body: some View {
        HStack {
            Image(store.logoImage)
                .resizable()
                .scaledToFit()
                .cornerRadius(25)
                .frame(width: 50, height: 50)
            
            VStack {
                Text(store.name)
                    .font(.subheadline)
            }
            
            Spacer()
        }
    }
}

struct StoreItemView_previews: PreviewProvider {
    static var previews: some View {
        StoreItemView(store: storesMock[0])
    }
}
