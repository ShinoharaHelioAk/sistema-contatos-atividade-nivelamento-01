//
//  ConteudoView.swift
//  ProjetoAcompanhamentoShopMaster-2
//
//  Created by Shinohara, Helio Akio on 07/05/26.
//

import SwiftUI

struct ConteudoView: View {
    @StateObject var carrinhoViewModel = CarrinhoViewModel()
    
    var body: some View {
        TabView {
            SecaoView(categoria: .eletronicos, carrinhoViewModel: carrinhoViewModel)
                .tabItem {
                    Label("Eletrônicos", systemImage: "desktopcomputer")
                } //Finaliza .tabItem
            
            SecaoView(categoria: .limpeza, carrinhoViewModel: carrinhoViewModel)
                .tabItem {
                    Label("Limpeza", systemImage: "sparkles")
                } //Finaliza .tabItem
            
            SecaoView(categoria: .pets, carrinhoViewModel: carrinhoViewModel)
                .tabItem {
                    Label("Pets", systemImage: "pawprint")
                } //Finaliza .tabItem
            
            CarrinhoView(carrinhoViewModel: carrinhoViewModel)
                .tabItem {
                    Label("Carrinho", systemImage: "cart")
                }//Finaliza .tabItem
        } //Finaliza TabView
    } //Finaliza var body
} //Finaliza struct

#Preview {
    ConteudoView()
}
