//
//  UserView.swift
//  Nettbutikk
//
//  Created by Amund Sundal Opkvitne on 30/03/2023.
//

import SwiftUI

struct UserView: View {
    @State private var users: [User] = []
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack{
            Text("Searching for \(searchText)")
                            .navigationTitle("Brukere")
                    .searchable(text: $searchText)
            
            List(users) { user in
                NavigationLink(destination: MainView(user: user)) {
                        Text(user.firstName)
                    }
                }
            }
        .task {
            do {
                users = try await getUsers(urlString: "https://dummyjson.com/users")
            }
            catch {
                print(error.localizedDescription)
            }
        }
        .refreshable {
            do {
                users = try await getUsers(urlString: "https://dummyjson.com/users")
            }
            catch {
                print(error.localizedDescription)
            }
        }
    }
}
    




struct ProfileView: View {
    
    var user: User
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom)
            List{
                Section {
                    Text(user.firstName)
                    Text(user.lastName)
                } header: {
                    Text("Navn")
                }
                
                Section {
                    Text(user.address.postalCode)
                } header: {
                    Text("Postkode")
                }
                
                Section {
                    Text(user.address.city)
                } header: {
                    Text("By")
                }
                
            }
            .padding()
        }
    }
}

struct contentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
