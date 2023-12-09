//
//  SubView.swift
//  TCASampleModal
//
//  Created by 柿崎逸 on 2023/12/09.
//

import SwiftUI
import ComposableArchitecture

struct SubView: View {
    @ObservedObject private var viewStore: ViewStoreOf<SubReducer>

    let store: StoreOf<SubReducer>

    init(store: StoreOf<SubReducer>) {
        self.store = store
        self.viewStore = ViewStore(store, observe: { $0 })
    }

    var body: some View {
        VStack(spacing: 30) {
            Text(viewStore.count.description)

            Button {
                viewStore.send(.onDismissButtonTapped)
            } label: {
                Text("閉じる")
            }
        }
    }
}


#Preview {
    SubView(store: Store(initialState: SubReducer.State(count: 0), reducer: {
        SubReducer()
    }))
}
