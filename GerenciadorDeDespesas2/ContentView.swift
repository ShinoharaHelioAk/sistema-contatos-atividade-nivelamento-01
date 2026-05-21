//
//  ContentView.swift
//  GerenciadorDeDespesas2
//
//  Created by Shinohara, Helio Akio on 15/05/26.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = DespesaViewModel()
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(viewModel.meses, id: \.self) { mes in
                    NavigationLink(destination: MesListView(mes: mes)) {
                        HStack {
                            Text(mes)
                            Spacer()
                            Text("R$ \(viewModel.totalPorMes(mes: mes), specifier: "%.2f")")
                        } //Fim HStack
                    } //Fim NavigationLink
                } //Fim ForEach
            } //Fim List
            .navigationTitle("Despesas")
            .onAppear {
                //Forçá atualização ao voltar para a primeira tela
                viewModel.fetchDespesas()
            } //Fim .onAppear
        } //Fim NavigationView
    } //Fim body
} //Fim struct

#Preview {
    ContentView()
}
