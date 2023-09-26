//
//  StoresContainerView.swift
//  ChefDelivery
//
//  Created by Luis Bandeira on 23/09/23.
//

import SwiftUI

struct StoresContainerView: View {
    
    let title = "Lojas"
    
    @State private var ratingFilter = 0
    
    var filteredStores: [StoreType] {
        return storesMock.filter { store in
            store.stars >= ratingFilter
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                HStack {
                    Text(title)
                        .font(.headline)
                    
                    Spacer()
                    
                    Menu("Filtrar") {
                        
                        Button(action: {
                            ratingFilter = 0
                        }, label: {
                            Text("Limpar filtro")
                        })
                        
                        Divider()
                        
                        ForEach(1...5, id: \.self) { rating in
                            Button {
                                ratingFilter = rating
                            } label: {
                                if rating > 1 {
                                    Text("\(rating) estrelas ou mais")
                                } else {
                                    Text("\(rating) estrela ou mais")
                                }
                                
                            }
                        }
                    }
                    .foregroundColor(.black)
                }
                
                Spacer()
            }
            
            VStack(alignment: .leading, spacing: 30) {
                
                if filteredStores.isEmpty {
                    Text("Nenhum resultado encontrado.")
                        .font(.title2)
                        .bold()
                        .foregroundColor(Color("ColorRed"))
                        .padding(.vertical, 32)
                        .frame(maxWidth: .infinity)
                } else {
                    ForEach(filteredStores) { mock in
                        NavigationLink {
                            StoreDetailView(store: mock)
                        } label: {
                            StoreItemView(store: mock)
                        }
                    }
                }
            }
            .foregroundColor(.black)
        }
        .padding(20)
    }
}

struct StoresContainerView_previews: PreviewProvider {
    static var previews: some View {
        StoresContainerView()
    }
}
