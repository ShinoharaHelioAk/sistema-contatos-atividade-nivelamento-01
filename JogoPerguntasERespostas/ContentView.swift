//
//  ContentView.swift
//  JogoPerguntasERespostas
//
//  Created by Shinohara, Helio Akio on 23/04/26.
//

import SwiftUI

struct ContentView: View {
    @State var nome: String = ""
    
    //let temasParaEscolha: [String] = ["Selecione um tema", "Games", "Livros", "Novelas", "Animais", "Ciências", "História", "Geografia", "Esportes", "Culinária", "Ciências Humanas"]
    let temasParaEscolha: [String] = ["Selecione um tema", "Games"]
    @State var temaSelecionado: String = "Selecione um tema"
    
    let perguntasSobreGames: [String] = []
    
    @State var desabilitaSelecaoTema: Bool = false
    
    //@State var score: Int = 0
    //@State var pergunta: String = ""
    
    var body: some View {
        ZStack {
            // Plano de Fundo
            Rectangle()
                .fill(Color.blue.opacity(0.1))
                .ignoresSafeArea()
            
            VStack (spacing: 20) {
                // Apresentação do Jogo
                Text("Bem vindo ao Jogo de Perguntas e Respostas!")
                    .font(.title)
                    .bold()
                    .foregroundColor(.blue)
                    .padding(.top)
                    .multilineTextAlignment(.center)
                
                VStack (alignment: .leading, spacing: 15) {
                    HStack {
                        ZStack {
                            // Label Tema selecionado
                            if desabilitaSelecaoTema {
                                Text ("Tema selecionado:")
                                    .bold()
                                    .padding(.init(top: 30, leading: 0, bottom: 10, trailing: 0))
                            } else {
                                // Label Escolha um tema
                                Text ("Escolha um tema:")
                                    .bold()
                                    .padding(.init(top: 30, leading: 0, bottom: 10, trailing: 0))
                            }
                        }
                        
                        ZStack {
                            if desabilitaSelecaoTema {
                                // Tema selecionado em formato texto
                                // Apresentado após o clique no botão Iniciar o jogo
                                Text(temaSelecionado)
                                .padding(.init(top: 30, leading: 15, bottom: 10, trailing: 0))
                                .padding(-10)
                            } else {
                                // Componente de seleção do tema
                                // Apresentado ao iniciar a aplicação
                                Picker("Selecione o tema", selection: $temaSelecionado) {
                                    ForEach(temasParaEscolha, id: \.self) {
                                        valorOpcao in Text(valorOpcao)
                                    }
                                }
                                .padding(.init(top: 30, leading: 15, bottom: 10, trailing: 0))
                                .pickerStyle(.menu)
                                .padding(-10)
                            }
                        }

                    }
                    
                    // Linha separadora
                    Rectangle()
                        .frame(height: 1)
                    
                    // Ocultar o botão Iniciar o jogo após o clique nele
                    ZStack {
                        if desabilitaSelecaoTema {
                            VStack {
                                
                                
                            }
                        } else {
                            // Botão Iniciar o jogo
                            Button(action: iniciarJogo) {
                                ZStack {
                                    Capsule()
                                    //.fill(Color.orange)
                                        .fill(temaSelecionado.contains("Selecione um tema") ? Color.gray : Color.blue)
                                        .frame(height: 50)
                                    Text("Iniciar o jogo")
                                        .foregroundColor(.white).bold()
                                }
                            }
                            .disabled(temaSelecionado.contains("Selecione um tema"))
                            .padding(10)
                        }
                    }
                    
                    Spacer()
                    
                    //Text("desabilitaSelecaoTema = \(desabilitaSelecaoTema)")
                }
                
                Spacer()
                
            }
            .padding()
        }
    }
    
    // Função para inicializar o jogo com as perguntas relacionadas ao tema escolhido.
    // Mostrar a pergunta 1 / 5, com a pergunta e os cards com as alternativas
    // Mostrar o botão Responder desabilitado. Ele só será habilitado quando uma das alternativas estiver selecionada.
    // Quando clicar no botão Responder, mostrar a alternativa correta e avançar para a próxima pergunta.
    func iniciarJogo() {
        // Desabilita o campo Picker.
        desabilitaSelecaoTema = true
        
        
        
        
        
        
    }
}

#Preview {
    ContentView()
}
