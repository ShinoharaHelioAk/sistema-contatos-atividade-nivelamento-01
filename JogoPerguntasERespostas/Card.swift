//
//  Card.swift
//  JogoPerguntasERespostas
//
//  Created by Shinohara, Helio Akio on 26/04/26.
//

import SwiftUI

// Estrutura Reutilizável
// Card
struct Card: View {
    // Variáveis
    let temaSelecionado: String
    let descricao: String
    
    var body: some View {
        HStack {
            
            VStack {
                
                Text(descricao)
                    .font(.headline)
                    .bold()
                
//                Text(String(idade))
//                    .font(.subheadline)
//                    .foregroundStyle(Color.gray)
                
                
            }
            
            // Espaçador
            Spacer()
        }
        .padding()
        //.background(Color.gray.opacity(0.3))
        .background(Color(.systemBackground))
        .cornerRadius(10)
        .shadow(
            color: .black.opacity(0.3),
            radius: 5,
            x: 10,
            y: 12
        )
    }
}
