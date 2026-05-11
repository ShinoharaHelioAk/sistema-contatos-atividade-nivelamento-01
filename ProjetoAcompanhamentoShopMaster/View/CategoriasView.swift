//
//  CategoriasView.swift
//  ProjetoAcompanhamentoShopMaster
//
//  Created by Shinohara, Helio Akio on 08/05/26.
//

import SwiftUI

struct CategoriasView: View {
    @StateObject var carrinhoViewModel = CarrinhoViewModel()
    
    var body: some View {
        List {
            NavigationLink("Eletrônicos") {
                SecaoView(categoria: .eletronicos, carrinhoViewModel: carrinhoViewModel)
            } //Finaliza NavigationLink eletrônicos
            
            NavigationLink("Produtos de Limpeza") {
                SecaoView(categoria: .limpeza, carrinhoViewModel: carrinhoViewModel)
            } //Finaliza NavigationLink limpeza
            
            NavigationLink("Produtos para Pets") {
                SecaoView(categoria: .pets, carrinhoViewModel: carrinhoViewModel)
            } //Finaliza NavigationLink pets
            
        } //Finaliza List
        .navigationBarTitle("Categorias")
    } //Finaliza var body
} //Finaliza struct

#Preview {
    CategoriasView()
}
