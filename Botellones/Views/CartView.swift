//
//  CartView.swift
//  Botellones
//
//  Created by Paul F on 26/02/25.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        ScrollView {
            if cartManager.paymentSuccess {
                Text("Thanks for your purchase! You'll get cozy in our comfy sweaters soon! You'll also receive an email confirmation shortly.")
                    .padding()
            } else {
                if cartManager.products.count > 0 {
                    ForEach(cartManager.products, id: \.id) { product in
                        ProductRow(product: product)
                    }
                    
                    HStack {
                        Text("El total de tu carrito es:")
                        Spacer()
                        Text("$\(cartManager.total).00 mx")
                            .bold()
                    }
                    .padding()
                    
                    PaymentButton(action: cartManager.pay)
                        .padding()
                    
                } else {
                    Text("Tu carrito esta vacio.")
                }
            }
        }
        .navigationTitle(Text("Mi carrito"))
        .padding(.top)
        .onDisappear {
            if cartManager.paymentSuccess {
                cartManager.paymentSuccess = false
            }
        }
    }
}

#Preview {
    CartView().environmentObject(CartManager())
}
