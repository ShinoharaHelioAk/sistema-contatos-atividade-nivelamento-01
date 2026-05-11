//
//  SecaoView.swift
//  ProjetoAcompanhamentoShopMaster
//
//  Created by Shinohara, Helio Akio on 08/05/26.
//

import SwiftUI

struct SecaoView: View {
    let categoria: Categoria
    @ObservedObject var carrinhoViewModel: CarrinhoViewModel
    
    var produtos: [Produto] {
        switch categoria {
            case .eletronicos:
                return [
                    Produto(nome: "Notebook", preco: 3500, categoria: .eletronicos),
                    Produto(nome: "Smartphone", preco: 2500, categoria: .eletronicos)
                ]
            case .limpeza:
                return [
                    Produto(nome: "Detergente", preco: 5, categoria: .limpeza),
                    Produto(nome: "Sabão em Pó", preco: 20, categoria: .limpeza)
                ]
            case .pets:
                return [
                    Produto(nome: "Ração", preco: 50, categoria: .pets),
                    Produto(nome: "Brinquedo", preco: 30, categoria: .pets)
                ]
        } //Finaliza bloco switch
    } //Finaliza var produtos
    
    var body: some View {
        List(produtos) { produto in
            HStack {
                Text(produto.nome)
                Spacer()
                Text("R$ \(produto.preco, specifier: "%.2f")")
                Button("+") {
                    carrinhoViewModel.adicionar(produto: produto)
                } //Finaliza Button("Adicionar")
                .font(.largeTitle)
            } //Finaliza HStack
        } //Finaliza List(produtos)
    } //Finaliza var body
}

//#Preview {
//    let viewModelExemplo = CarrinhoViewModel()
//    SecaoView(categoria: .eletronicos, carrinhoViewModel: viewModelExemplo)
//}
