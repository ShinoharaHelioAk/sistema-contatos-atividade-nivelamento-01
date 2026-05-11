//
//  ProdutoViewModel.swift
//  ProjetoAcompanhamentoShopMaster
//
//  Created by Shinohara, Helio Akio on 07/05/26.
//

import Foundation
import SwiftUI
internal import Combine

// Classe
class ProdutoViewModel: ObservableObject {
    // Ao alterar o conteúdo, a UI será atualizada
    @Published var produtos: [Produto] = []
    
    // Construtor
    init() {
        adicionarProduto(nome: "Smartphone", preco: 1000.00, categoria: .eletronicos)
        adicionarProduto(nome: "Detergente", preco: 10.00, categoria: .limpeza)
        adicionarProduto(nome: "Ração", preco: 10.00, categoria: .pets)
    }
    
    // Função de cadastro
    func adicionarProduto(nome: String, preco: Double, categoria: Categoria) {
        let novoProduto = Produto(nome: nome, preco: preco, categoria: categoria)
        produtos.append(novoProduto)
    }
    
    // Função de alteração
    func atualizarProduto(produto: Produto, novoNome: String) {
        guard let index = produtos.firstIndex(where: {
            // $0 -> Referência do array persons
            $0.id == produto.id
        }) else { return }
        
        // Altera o nome
        produtos[index].nome = novoNome
        
    }
    
    // Função de remoção
    func removerProduto(at offsets: IndexSet) {
        produtos.remove(atOffsets: offsets)
    }
}
