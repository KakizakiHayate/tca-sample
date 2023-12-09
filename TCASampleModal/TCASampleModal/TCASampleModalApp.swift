//
//  TCASampleModalApp.swift
//  TCASampleModal
//
//  Created by 柿崎逸 on 2023/12/09.
//

import SwiftUI
import ComposableArchitecture

@main
struct TCASampleModalApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(store: Store(initialState: ContentReducer.State(), reducer: {
                ContentReducer()
            }))
        }
    }
}
