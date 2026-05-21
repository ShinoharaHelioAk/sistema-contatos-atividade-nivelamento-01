//
//  GerenciadorDeDespesas2App.swift
//  GerenciadorDeDespesas2
//
//  Created by Shinohara, Helio Akio on 15/05/26.
//

import SwiftUI
internal import CoreData

@main
struct GerenciadorDeDespesas2App: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(DespesaViewModel())
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
