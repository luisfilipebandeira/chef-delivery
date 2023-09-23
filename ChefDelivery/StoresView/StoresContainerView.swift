//
//  StoresContainerView.swift
//  ChefDelivery
//
//  Created by Luis Bandeira on 23/09/23.
//

import SwiftUI

struct StoresContainerView: View {
    
    let title = "Lojas"
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .font(.headline)
                
                Spacer()
            }
            
            VStack(alignment: .leading, spacing: 30) {
                ForEach(storesMock) { mock in
                    StoreItemView(order: mock)
                }
            }
        }
        .padding(20)
    }
}

struct StoresContainerView_previews: PreviewProvider {
    static var previews: some View {
        StoresContainerView()
    }
}
