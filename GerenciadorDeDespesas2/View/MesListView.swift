//
//  MesListView.swift
//  GerenciadorDeDespesas2
//
//  Created by Shinohara, Helio Akio on 21/05/26.
//

import SwiftUI

struct MesListView: View {
    @EnvironmentObject var viewModel: DespesaViewModel
    var mes: String
    
    var body: some View {
        VStack {
            List {
                ForEach(viewModel.despesasPorMes(mes: mes)) { despesa in
                    HStack {
                        Text(despesa.categoria ?? "")
                        Spacer()
                        Text("R$ \(despesa.valor, specifier: "%.2f")")
                    } //Fim HStack
                } //Fim ForEach
                .onDelete { indexSet in
                    indexSet.map {
                        viewModel.despesasPorMes(mes: mes)[$0]
                    }.forEach(viewModel.removerDespesa) //Fim indexSet.map
                } //Fim .onDelete
            } //Fim List
            
            NavigationLink(
                "Adicionar",
                destination: DespesaFormView(mes: mes)
            )
            .padding()
            
        } //Fim VStack
        .navigationTitle(mes)
    } //Fim body
} //Fim struct
