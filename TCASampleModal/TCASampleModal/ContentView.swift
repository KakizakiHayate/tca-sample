//
//  ContentView.swift
//  TCASampleModal
//
//  Created by 柿崎逸 on 2023/12/09.
//

import SwiftUI
import ComposableArchitecture

struct ContentView: View {
    @ObservedObject private var viewStore: ViewStoreOf<ContentReducer>

    let store: StoreOf<ContentReducer>

    init(store: StoreOf<ContentReducer>) {
        self.store = store
        self.viewStore = ViewStore(store, observe: { $0 })
    }

    var body: some View {
        VStack(spacing: 30) {
            Text(viewStore.count.description)

            Button {
                viewStore.send(.plusButtonTapped)
            } label: {
                Text("+")
            }

            Button {
                viewStore.send(.minusButtonTapped)
            } label: {
                Text("-")
            }

            Button {
                viewStore.send(.onPresentButtonTapped)
            } label: {
                Text("表示")
            }
        }
        .sheet(store: store.scope(state: \.$subState, action: ContentReducer.Action.subAction)) { store in
            SubView(store: store)
        }
    }
}

#Preview {
    ContentView(
        store: Store(
            initialState: ContentReducer.State(),
            reducer: {
                ContentReducer()
            }
        )
    )
}
