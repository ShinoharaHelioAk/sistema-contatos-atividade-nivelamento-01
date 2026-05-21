//
//  DespesaFormView.swift
//  GerenciadorDeDespesas2
//
//  Created by Shinohara, Helio Akio on 21/05/26.
//

import SwiftUI

struct DespesaFormView: View {
    @EnvironmentObject var viewModel: DespesaViewModel
    @Environment(\.dismiss) var dismiss
    
    var mes: String
    
    @State private var categoria: String = "Energia"
    @State private var valor: String = ""
    
    var body: some View {
        Form {
            Picker("Categoria", selection: $categoria) {
                ForEach(viewModel.categorias, id: \.self) {
                    Text($0)
                } //Fim ForEach
            } //Fim Picker
            
            TextField(
                "Valor",
                text: $valor
            )
            .keyboardType(.decimalPad)
            
            Button("Salvar") {
                if let valorDouble = Double(valor) {
                    viewModel.cadastrarDespesa(
                        categoria: categoria,
                        valor: valorDouble,
                        mes: mes
                    )
                    dismiss()
                } //Fim if
            } //Fim Button
            
        } //Fim Form
        .navigationTitle("Nova Despesa")
    } //Fim body
} //Fim struct
