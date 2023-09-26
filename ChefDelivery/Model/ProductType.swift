//
//  ProductType.swift
//  ChefDelivery
//
//  Created by Luis Bandeira on 24/09/23.
//

import Foundation

struct ProductType: Identifiable {	    
    let id: Int
    let name: String
    let description: String
    let image: String
    let price: Double 
    
    var formattedPrice: String {
        return "R$" + price.formatPrice()
    }
}
