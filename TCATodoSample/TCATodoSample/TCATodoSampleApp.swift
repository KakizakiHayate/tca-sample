//
//  TCATodoSampleApp.swift
//  TCATodoSample
//
//  Created by 柿崎逸 on 2023/12/08.
//

import SwiftUI
import ComposableArchitecture

@main
struct TCATodoSampleApp: App {
    var body: some Scene {
        WindowGroup {
            AppView(store: Store(
                initialState: Todos.State()){
                    Todos()._printChanges()
                }
            )
        }
    }
}
