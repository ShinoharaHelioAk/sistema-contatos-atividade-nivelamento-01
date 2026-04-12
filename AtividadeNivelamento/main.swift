//
//  main.swift
//  AtividadeNivelamento
//
//  Created by Shinohara, Helio Akio on 09/04/26.
//

var gerenciador = GerenciadorDeContatos()
var continuar: String = "s"
repeat {
    print("\n\nGERENCIADOR DE CONTATOS\n")
    print("MENU")
    print("1 - Cadastrar contato")
    print("2 - Listar contato")
    print("3 - Alterar contato")
    print("4 - Remover contato")
    print("5 - Finalizar")
    
    if let opcao = readLine() {
        switch opcao {
            case "1":
            gerenciador.cadastrarContato()
        case "2":
            gerenciador.listarContatos()
        case "3":
            gerenciador.atualizarContato()
        case "4":
            gerenciador.excluirContato()
        case "5":
            continuar = "n"
        default:
            print("Opção inválida!")
        }
    }
    
    // Estrutura de loop para finalizar a aplicação quando o usuário solicitar.
    guard continuar.lowercased() == "s" else {
        if continuar.lowercased() != "n" {
            print("Tecla pressionada diferente de 's' ou 'n'. Forçando encerramento...")
        }
        print("Finalizado.")
        break
    }
} while true

