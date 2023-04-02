//
//  Tabview.swift
//  Nettbutikk
//
//  Created by Amund Sundal Opkvitne on 30/03/2023.
//

import SwiftUI

struct MainView: View {
    var user: User
    var body: some View {
            TabView {
                ProfileView(user: user)
                    .tabItem {
                        
                        Label("Profile", systemImage: "person")
                    }
                
                ShoppingcartView(user: user)
                    .tabItem {
                        Label("Shoppingcart", systemImage: "cart")
                    }
                
                
                ContentView()
                    .tabItem {
                        Label("Order", systemImage: "square.and.pencil")
                }
            }
        }
    }

