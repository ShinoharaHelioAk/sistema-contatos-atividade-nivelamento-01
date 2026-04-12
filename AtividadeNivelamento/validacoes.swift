//
//  funcoes.swift
//  AtividadeNivelamento
//
//  Created by Shinohara, Helio Akio on 12/04/26.
//

// Verifica se o nome digitado já está cadastrado.
func nomeJaCadastrado(nome: String, contatos: [Contato]) -> Bool {
    contatos.contains(where: { $0.nome.lowercased() == nome.lowercased() })
}

func validarDigitacao(campo: String, valor: String, contatos: [Contato]) -> Bool {
    switch campo {
        case "nome":
        // Verifica se o nome foi digitado
        guard !valor.isEmpty else {
            print("Erro: Nome precisa ser preenchido!")
            return false
        }
        
        // Verifica se o nome já existe na lista de contatos
        guard !nomeJaCadastrado(nome: valor, contatos: contatos) else {
            print("Erro: Nome já cadastrado!")
            return false
        }
        return true
    case "idade":
        // Verifica se a idade foi digitada corretamente, não é negativa e não é uma idade absurda
        guard (Int(valor) != nil), (UInt(valor) != nil), Int(valor) ?? 0 <= 130 else {
            print("Erro: Idade inválida!")
            return false
        }
        return true
    case "telefone":
        // Verifica se o telefone foi digitado
        guard !valor.isEmpty else {
            print("Erro: Telefone inválido!")
            return false
        }
        return true
    case "email":
        // Verifica se o e-mail foi digitado e se foi digitado corretamente
        guard !valor.isEmpty, valor.contains("@") else {
            print("Erro: E-mail inválido!")
            return false
        }
        return true
    case "informaID":
        // Verifica se o ID do contato foi digitado corretamente
        guard let id: Int = Int(valor), (UInt(valor) != nil), contatos.contains(where: { $0.id+1 == id }) else {
            print("Erro: ID inválido!")
            return false
        }
        return true
    default:
        // Caso não tenha passado em nenhum dos cases anteriores, mostra mensagem de retorno dizendo que
        // não consistiu em nenhum dos campos esperados.
        print("Não foi possível verificar a validação da informação. Não consistiu em nenhum dos campos esperados.")
        return false
    }
}

