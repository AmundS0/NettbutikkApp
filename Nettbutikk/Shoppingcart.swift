//
//  Shoppingcart.swift
//  Nettbutikk
//
//  Created by Amund Sundal Opkvitne on 31/03/2023.
//

import Foundation

struct ShoppingcartUser: Codable {
    var carts:[Shoppingcart]
}

struct Shoppingcart: Codable, Identifiable{
    var id: Int
    var total: Double
    var products: [Product]
}

func getShoppingcart(urlString: String) async throws -> Shoppingcart? {
    let url = URL(string: urlString)!
    let urlrequest = URLRequest(url: url)
    
    let (data, _) = try await URLSession.shared.data(for: urlrequest)
    let svar = try JSONDecoder().decode(ShoppingcartUser.self, from: data)
    return svar.carts.first
}





