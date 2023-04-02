//
//  ShoppingcartView.swift
//  Nettbutikk
//
//  Created by Amund Sundal Opkvitne on 31/03/2023.
//
import SwiftUI

struct ShoppingcartView: View {
    var user: User
    @State private var shoppingcart: Shoppingcart? = nil
    
    
    var body: some View {
        if let shoppingcart = shoppingcart {
            NavigationStack{
                List(shoppingcart.products) { product in
                    Text(product.title)
                }
                .navigationTitle("Handlekurv")
            }
        }
        else {
            ZStack{
                LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom)
                Text("Din handlekurv er tom")
                    .task {
                        do {
                            shoppingcart = try await getShoppingcart(urlString: "https://dummyjson.com/carts/user/" + String(user.id))
                        }
                        catch {
                            print(error.localizedDescription)
                        }
                    }
            }
        }
    }
        
        
        
    
    struct contentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
