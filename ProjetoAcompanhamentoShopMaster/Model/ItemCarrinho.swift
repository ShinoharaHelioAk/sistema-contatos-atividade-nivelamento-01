//
//  Carrinho.swift
//  ProjetoAcompanhamentoShopMaster-2
//
//  Created by Shinohara, Helio Akio on 07/05/26.
//

import Foundation

struct ItemCarrinho: Identifiable {
    var id: UUID = UUID()
    var produto: Produto
    var quantidade: Int
}
