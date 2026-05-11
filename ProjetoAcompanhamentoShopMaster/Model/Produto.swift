//
//  Produto.swift
//  ProjetoAcompanhamentoShopMaster
//
//  Created by Shinohara, Helio Akio on 07/05/26.
//

import Foundation

// Estrutura
struct Produto: Identifiable {
    var id: UUID = UUID()
    var nome: String
    var preco: Double
    var categoria: Categoria
}
