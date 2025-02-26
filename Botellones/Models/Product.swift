//
//  Product.swift
//  Mousy-Water
//
//  Created by Paul Jaime Felix Flores on 13/10/23.
//

import Foundation
struct Product: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var price: Int
}

var productList = [Product(name: "Botellon 20 litros", image: "botellon1", price: 15 ),
                   Product(name: "Botellon 10 litros", image: "botellon2", price: 10 ),
                   Product(name: "Cambia tus 10 tapas", image: "tapas", price: 0)]
