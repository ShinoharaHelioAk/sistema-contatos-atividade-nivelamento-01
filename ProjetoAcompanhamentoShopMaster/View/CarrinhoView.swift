//
//  CarrinhoView.swift
//  ProjetoAcompanhamentoShopMaster-2
//
//  Created by Shinohara, Helio Akio on 08/05/26.
//

import SwiftUI

struct CarrinhoView: View {
    @ObservedObject var carrinhoViewModel: CarrinhoViewModel
    
    var body: some View {
        VStack {
            List(carrinhoViewModel.itens) { item in
                HStack {
                    Text(item.produto.nome)
                    Spacer()
                    Text("Qtd: \(item.quantidade)")
                    Button("-") {
                        carrinhoViewModel.remover(produto: item.produto)
                    } //Finaliza Button(Remover)
                    .font(.largeTitle)
                } //Finaliza HStack
            } //Finaliza List
            Text("Total: R$ \(carrinhoViewModel.total, specifier: "%.2f")")
                .font(.title)
                .padding()
        } //Finaliza VStack
    }  //Finaliza var body
} //Finaliza struct

//#Preview {
//    CarrinhoView()
//}
