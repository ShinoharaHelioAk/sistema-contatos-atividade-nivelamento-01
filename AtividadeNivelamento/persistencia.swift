//
//  persistencia.swift
//  AtividadeNivelamento
//
//  Created by Shinohara, Helio Akio on 12/04/26.
//sistema-contatos-atividade-nivelamento-01
//Sistema de Contatos - Atividade de Nivelamento - Curso IOS (Capgemini - Proway)

func inserirContato(id: Int, nome: String, idade: Int, telefone: String, email: String, contatos: inout [Contato]) -> Void {
    contatos.append(Contato(id: id, nome: nome, idade: idade, telefone: telefone, email: email))
}

func trazerListaDeContatos(contatos: [Contato]) -> Void {
    for indice in contatos.indices {
        print("\nID: \(contatos[indice].id+1)")
        print("Nome: \(contatos[indice].nome)")
        print("Idade: \(contatos[indice].idade)")
        print("Telefone: \(contatos[indice].telefone)")
        print("E-mail: \(contatos[indice].email)")
    }
}

func modificarContato(id: String, nome: String, idade: String, telefone: String, email: String, contatos: inout [Contato]) -> Void {
    contatos[Int((UInt(id) ?? 0)-1)] = Contato(id: Int((UInt(id) ?? 0)-1), nome: nome, idade: Int(UInt(idade) ?? 0), telefone: telefone, email: email)
}

func removerContato(id: String, contatos: inout [Contato]) -> Void {
    contatos.remove(at: Int((UInt(id) ?? 0)-1))
}
