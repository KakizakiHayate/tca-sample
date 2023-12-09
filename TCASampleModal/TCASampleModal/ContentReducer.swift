//
//  ContentReducer.swift
//  TCASampleModal
//
//  Created by 柿崎逸 on 2023/12/09.
//

import Foundation
import ComposableArchitecture

public struct ContentReducer: Reducer {
    public init() {}

    // MARK: - State
    public struct State: Equatable {
        @PresentationState var subState: SubReducer.State?
        var count = 0

        public init() {}
    }

    // MARK: - Action
    public enum Action: Equatable {
        case subAction(PresentationAction<SubReducer.Action>)
        case onPresentButtonTapped
        case plusButtonTapped
        case minusButtonTapped
    }

    // MARK: - Reducer
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .onPresentButtonTapped:
                state.subState = .init(count: state.count) // ここで代入されることによってモーダルが表示される
                return .none
            case .subAction:
                return .none
            case .plusButtonTapped:
                state.count += 1
                return .none
            case .minusButtonTapped:
                state.count -= 1
                return .none
            }
        }
        .ifLet(\.$subState, action: /Action.subAction) {
            SubReducer() // ここがないと`dismiss`できなくなる
        }
    }
}
