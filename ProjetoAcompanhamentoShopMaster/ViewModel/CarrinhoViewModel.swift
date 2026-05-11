//
//  CarrinhoViewModel.swift
//  ProjetoAcompanhamentoShopMaster-2
//
//  Created by Shinohara, Helio Akio on 07/05/26.
//

import Foundation
internal import Combine

class CarrinhoViewModel: ObservableObject {
    @Published var itens: [ItemCarrinho] = []
    
    func adicionar(produto: Produto) {
        if let index = itens.firstIndex(where: { $0.produto.id == produto.id }) {
            itens[index].quantidade += 1
        } else {
            itens.append(ItemCarrinho(produto: produto, quantidade: 1))
        } //Finaliza if
    } //Finaliza func adicionar
    
    func remover(produto: Produto) {
        if let index = itens.firstIndex(where: { $0.produto.id == produto.id }) {
            if itens[index].quantidade > 1 {
                itens[index].quantidade -= 1
            } else {
                itens.remove(at: index)
            } //Finaliza if itens
        } //Finaliza if let index
    } //Finaliza func remover
    
    var total: Double {
        itens.reduce(0) { $0 + ($1.produto.preco * Double($1.quantidade)) }
    }
} //Finaliza class CarrinhoViewModel
