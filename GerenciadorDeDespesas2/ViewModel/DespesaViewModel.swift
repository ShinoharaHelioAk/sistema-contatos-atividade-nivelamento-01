//
//  DespesaViewModel.swift
//  GerenciadorDeDespesas2
//
//  Created by Shinohara, Helio Akio on 15/05/26.
//

import Foundation
internal import Combine
internal import CoreData

class DespesaViewModel: ObservableObject {
    private let context = PersistenceController.shared.container.viewContext
    
    @Published var despesas: [Despesa] = []
    
    let meses = ["Janeiro", "Fevereiro", "Março", "Abril", "Maio"]
    let categorias = [
        "Energia", "Internet", "Água", "Assinaturas",
        "Aluguel", "Mercado", "Cursos", "Lazer"
    ]
    
    //Construtor
    init() {
        fetchDespesas()
    } //Fim init()

    //Buscar lista de despesas
    func fetchDespesas() {
        let request: NSFetchRequest<Despesa> = Despesa.fetchRequest()
        
        do {
            despesas = try context.fetch(request)
        } //Fim do
        catch {
            print("Erro ao carregar a lista de despesas: \(error.localizedDescription)")
        } //Fim catch
    } //Fim func fetchDespesas
    
    //Cadastrar despesa
    func cadastrarDespesa(categoria: String, valor: Double, mes: String) {
        let novaDespesa = Despesa(context: context)
        
        novaDespesa.id = UUID()
        novaDespesa.categoria = categoria
        novaDespesa.valor = valor
        novaDespesa.mes = mes
        
        salvar()
    } //Fim func cadastrarDespesa
    
    //Remover despesa
    func removerDespesa(despesa: Despesa) {
        context.delete(despesa)
        salvar()
    } //Fim func removerDespesa
    
    //Salvar despesa
    func salvar() {
        do {
            try context.save()
            fetchDespesas()
        } catch {
            print("Erro ao salvar a despesa: \(error.localizedDescription)")
        } //Fim catch
    } //Fim func salvar
    
    //Traz lista de despesas por mês
    func despesasPorMes(mes: String) -> [Despesa] {
        despesas.filter { $0.mes == mes }
    }

    //Traz total das depesas por mês
    func totalPorMes(mes: String) -> Double {
        despesasPorMes(mes: mes).reduce(0) { $0 + $1.valor }
//        despesas
//            .filter {$0.mes.rawValue == mes)}
//            .reduce(0) { $0 + $1.valor }
            
    }

    
} //Fim class
