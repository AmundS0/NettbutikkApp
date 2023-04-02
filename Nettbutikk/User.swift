//
//  User.swift
//  Nettbutikk
//
//  Created by Amund Sundal Opkvitne on 30/03/2023.
//

import Foundation

struct User: Identifiable, Codable{
    var id: Int
    var firstName: String
    var lastName: String
    var address: Address
}


struct Address: Codable{
    var address: String
    var city: String
    var postalCode: String
}

struct Users: Codable{
    var users: [User]
}

func getUsers(urlString: String) async throws -> [User] {
    let url = URL(string: urlString)!
    let urlrequest = URLRequest(url: url)
    
    let (data, _) = try await URLSession.shared.data(for: urlrequest)
    let svar = try JSONDecoder().decode(Users.self, from: data)
    return svar.users
}


