//
//  ContentView.swift
//  TCATodoSample
//
//  Created by 柿崎逸 on 2023/12/08.
//

import ComposableArchitecture
import SwiftUI

struct Todo: Reducer {
  struct State: Equatable, Identifiable {
    @BindingState var description = ""
    let id: UUID
    @BindingState var isComplete = false
  }

  enum Action: BindableAction, Sendable {
    case binding(BindingAction<State>)
  }

  var body: some Reducer<State, Action> {
    BindingReducer()
  }
}

struct TodoView: View {
  let store: StoreOf<Todo>

  var body: some View {
    WithViewStore(self.store, observe: { $0 }) { viewStore in
      HStack {
        Button {
          viewStore.$isComplete.wrappedValue.toggle()
        } label: {
          Image(systemName: viewStore.isComplete ? "checkmark.square" : "square")
        }
        .buttonStyle(.plain)

        TextField("Untitled Todo", text: viewStore.$description)
      }
      .foregroundColor(viewStore.isComplete ? .gray : nil)
    }
  }
}

#Preview {
    TodoView(
        store: Store(
            initialState: Todo.State(id: UUID())) {
                Todo()
            }
    )
}
