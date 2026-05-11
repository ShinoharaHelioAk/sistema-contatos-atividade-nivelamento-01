//
//  ContentView.swift
//  ProjetoAcompanhamentoShopMaster
//
//  Created by Shinohara, Helio Akio on 07/05/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Seja bem vindo!")
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)
                Text("Aproveite suas compras!")
                    .font(.title)
                    .padding()
                
                NavigationLink("Começar Compras") {
                    ConteudoView()
                } //Finaliza NavigationLink
                .buttonStyle(.borderedProminent)
            } //Finaliza VStack
            .padding()
        } //Finaliza NavigationStack
    }
}

#Preview {
    ContentView()
}
