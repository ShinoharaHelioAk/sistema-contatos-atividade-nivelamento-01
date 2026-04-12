//
//  GerenciadorDeContatos.swift
//  AtividadeNivelamento
//
//  Created by Shinohara, Helio Akio on 11/04/26.
//
struct GerenciadorDeContatos {
    private var contatos: [Contato] = []
    
    // Cadastra novo contato
    mutating func cadastrarContato() {
        // Lista os contatos já cadastrados para auxiliar no cadastro do novo registro.
        // Se a lista estiver vazia, vai exibir a mensagem "Nenhum contato cadastrado!"
        listarContatos()
        
        // Solicita o nome
        print("\nDigite o nome:")
        let nome: String = readLine() ?? ""
        
        // Faz a validação das regras de negócio para o nome informado
        if !validarDigitacao(campo: "nome", valor: nome, contatos: contatos) {
            return
        }
        
        // Solicita a idade
        print("Digite a idade:")
        let idadeString: String = readLine() ?? ""
        
        // Faz a validação das regras de negócio para a idade informada
        if !validarDigitacao(campo: "idade", valor: idadeString, contatos: contatos) {
            return
        }
        
        // Solicita o telefone
        print("Digite o telefone:")
        let telefone: String = readLine() ?? ""
        
        // Faz a validação das regras de negócio para o telefone informado
        if !validarDigitacao(campo: "telefone", valor: telefone, contatos: contatos) {
            return
        }
        
        // Solicita o e-mail
        print("Digite o e-mail:")
        let email: String = readLine() ?? ""
        
        // Faz a validação das regras de negócio para o telefone informado
        if !validarDigitacao(campo: "email", valor: email, contatos: contatos) {
            return
        }
        
        inserirContato(id: contatos.count, nome: nome, idade: Int(UInt(idadeString) ?? 0), telefone: telefone, email: email, contatos: &contatos)
//        contatos.append(Contato(id: contatos.count, nome: nome, idade: Int(UInt(idadeString) ?? 0), telefone: telefone, email: email))
        print("Contato cadastrado com sucesso!")
    }
    
    //Listagem de Contatos cadastrados
    func listarContatos() {
        if contatos.isEmpty {
            print("Nenhum contato cadastrado!")
        } else {
            print("\nListagem de contatos - Quantidade de contatos: \(contatos.count):")
            
            trazerListaDeContatos(contatos: contatos)
//            for indice in contatos.indices {
//                print("\nID: \(contatos[indice].id+1)")
//                print("Nome: \(contatos[indice].nome)")
//                print("Idade: \(contatos[indice].idade)")
//                print("Telefone: \(contatos[indice].telefone)")
//                print("E-mail: \(contatos[indice].email)")
//            }
        }
    }
    
    mutating func atualizarContato() {
        // Lista os contatos já cadastrados para auxiliar no cadastro do novo registro.
        // Se a lista estiver vazia, vai exibir a mensagem "Nenhum contato cadastrado!"
        listarContatos()
        
        //Se a lista de contatos estiver vazia, volta para o menu principal
        if contatos.isEmpty {
            return
        }
        
        /*
         Solicita o ID do contato a ser atualizado
         O ID a ser digitado precisa:
            * Ser um número positivo
            * Ser um ID existente
        */
        print("\nDigite o ID do contato a ser atualizado:")
        let idString: String = readLine() ?? ""
        
        // Faz a validação das regras de negócio para o ID informado
        if !validarDigitacao(campo: "informaID", valor: idString, contatos: contatos) {
            return
        }
        
        // Solicita o novo nome
        print("Digite o novo nome:")
        let nome: String = readLine() ?? ""
        
        // Faz a validação das regras de negócio para o nome informado
        if !validarDigitacao(campo: "nome", valor: nome, contatos: contatos) {
            return
        }
        
        // Solicita a nova idade
        print("Digite a nova idade:")
        let idadeString: String = readLine() ?? ""
        
        // Faz a validação das regras de negócio para a idade informada
        if !validarDigitacao(campo: "idade", valor: idadeString, contatos: contatos) {
            return
        }
        
        // Solicita o novo telefone
        print("Digite o novo telefone:")
        let telefone: String = readLine() ?? ""
        
        // Faz a validação das regras de negócio para o telefone informado
        if !validarDigitacao(campo: "telefone", valor: telefone, contatos: contatos) {
            return
        }
        
        // Solicita o novo e-mail
        print("Digite o novo e-mail:")
        let email: String = readLine() ?? ""
        
        // Faz a validação das regras de negócio para o telefone informado
        if !validarDigitacao(campo: "email", valor: email, contatos: contatos) {
            return
        }
        
        modificarContato(id: idString, nome: nome, idade: idadeString, telefone: telefone, email: email, contatos: &contatos)
//        contatos[Int((UInt(idString) ?? 0)-1)] = Contato(id: Int((UInt(idString) ?? 0)-1), nome: nome, idade: Int(UInt(idadeString) ?? 0), telefone: telefone, email: email)
        print("Contato atualizado com sucesso!")
    }
    
    mutating func excluirContato() {
        // Lista os contatos já cadastrados para auxiliar no cadastro do novo registro.
        // Se a lista estiver vazia, vai exibir a mensagem "Nenhum contato cadastrado!"
        listarContatos()
        
        //Se a lista de contatos estiver vazia, não continuar
        if contatos.isEmpty {
            return
        }
        
        /*
         Solicita o ID do contato a ser removido
         O ID a ser digitado precisa:
            * Ser um número positivo
            * Ser um ID existente
        */
        print("\nDigite o ID do contato a ser excluído:")
        let idString: String = readLine() ?? ""
        
        // Faz a validação das regras de negócio para o ID informado
        if !validarDigitacao(campo: "informaID", valor: idString, contatos: contatos) {
            return
        }
        
        removerContato(id: idString, contatos: &contatos)
//        contatos.remove(at: Int((UInt(idString) ?? 0)-1))
        print("Contato excluído com sucesso!")
        
        // Se após a remoção não houver mais contatos cadastrados, vai informar para o usuário
        if contatos.isEmpty {
            print("Não há mais contatos cadastrados!")
        }
        
        // Faz atualização dos índices da lista.
        for indice in contatos.indices {
            contatos[indice] = Contato(id: Int(indice), nome: contatos[indice].nome, idade: Int(UInt(contatos[indice].idade)), telefone: contatos[indice].telefone, email: contatos[indice].email)
        }
    }
}
