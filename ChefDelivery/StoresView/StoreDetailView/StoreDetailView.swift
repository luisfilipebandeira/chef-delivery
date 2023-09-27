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
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, content: {
                StoreDetailHeaderView(store: store)
                
                StoreDetailProductsView(store: store)
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
