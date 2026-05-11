//
//  ProdutoView.swift
//  ProjetoAcompanhamentoShopMaster
//
//  Created by Shinohara, Helio Akio on 07/05/26.
//

import SwiftUI

struct ProdutoView: View {
    // Importar as funcionalidades da camada ViewModel
    @StateObject var viewModel = ProdutoViewModel()
    
    // Visibilidade da propriedade sheet (exibir ou ocultar folha)
    @State var mostrarSheet: Bool = false
    
    // Verificar se haverá um cadastro ou edição
    @State var editarProduto: Produto?
    
    // Body
    var body: some View {
        // NavigationStack
        NavigationStack {
            // Listagem de produtos
            List {
                // Laço de repetição
                ForEach(viewModel.produtos) { produto in
                    VStack(alignment: .leading) {
                        Text(produto.nome)
                            .font(.headline)
                    }
                    // Remover produtos
                    // Alternativa ao .onDelete, para customizar o botão remover.
                    // .trailing -> Arrastar da direita para esquerda
                    // .leading -> Arrastar da esquerda para direita
                    .swipeActions(edge: .trailing) {
                        Button {
                            if let index = viewModel.produtos.firstIndex(where: {
                                $0.id == produto.id
                            }) {
                                viewModel.removerProduto(at: IndexSet(integer: index))
                            }
                        } label: {
                            Label("Remover", systemImage: "trash")
                        }
                        .tint(Color.orange)
                    }
                    
                    // Alterar produtos
                    // Alternativa ao .onDelete, para customizar o botão remover.
                    // .trailing -> Arrastar da direita para esquerda
                    // .leading -> Arrastar da esquerda para direita
                    .swipeActions(edge: .leading) {
                        Button {
                            editarProduto = produto
                            mostrarSheet = true
                        } label: {
                            Label("Alterar", systemImage: "pencil")
                        }
                        .tint(Color.blue)
                    }
                    
                }
                // Efeito ao mover o registro da direita para esquerda
                //.onDelete(perform: viewModel.removePerson)
            } // Término da Lista
            
            // Configurações do NavigationStack
            .navigationTitle("Lista de Produtos")
            .toolbar {
                Button {
                    editarProduto = nil
                    mostrarSheet = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            
        } // NavigationStack
        // Disponibilizar a propriedade sheet
        .sheet(isPresented: $mostrarSheet) {
            ProdutoFormView(viewModel: viewModel, editarProduto: editarProduto)
        }
    } // body
} // struct

// Estrutura para exibir uma folha (Sheet)
struct ProdutoFormView: View {
    // Referência para fechar a folha
    @Environment(\.dismiss) var dismiss
    
    // ViewModel
    @ObservedObject var viewModel: ProdutoViewModel
    
    // Obter a pessoa que terá seus dados alterados
    var editarProduto: Produto?
    
    // States
    @State var nome: String = ""
    
    var body: some View {
        // NavigationStack
        NavigationStack {
            Form {
                TextField("Nome", text: $nome)
                //TextField("Cidade", text: $city)
            }
            
            // Características do NavigationStack
            .navigationTitle(editarProduto == nil ? "Cadastrar" : "Alterar")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    
                    if let produto = editarProduto {
                        Button("Alterar") {
                            viewModel.atualizarProduto(produto: produto, novoNome: nome)
                            dismiss()
                        }
                        .disabled(nome.isEmpty)
                    } else {
                        Button("Salvar") {
                            viewModel.adicionarProduto(nome: nome, preco: 100, categoria: .eletronicos)
                            dismiss()
                        }
                        .disabled(nome.isEmpty)
                    } // Finaliza o if
                        
                } // Finaliza o ToolbarItem
            } // Finaliza o .toolbar
        } // Finaliza o NavigationStack
        .onAppear {
            if let produto = editarProduto {
                nome = produto.nome
            }
        }
    } // Finaliza o body
}

#Preview {
    ProdutoView()
}
