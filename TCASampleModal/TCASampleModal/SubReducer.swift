//
//  SubReducer.swift
//  TCASampleModal
//
//  Created by 柿崎逸 on 2023/12/09.
//

import Foundation
import ComposableArchitecture

public struct SubReducer: Reducer {
    @Dependency(\.dismiss) var dismiss // モーダルを閉じるために必要

    public init() {}

    // MARK: - State
    public struct State: Equatable {
        var count: Int // ここで欲しい値を受け取る

        public init(count: Int) {
            self.count = count
        }
    }

    // MARK: - Action
    public enum Action: Equatable {
        case onDismissButtonTapped
    }

    // MARK: - Reducer
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .onDismissButtonTapped:
                return .run { _ in await self.dismiss() } // ここで閉じる
            }
        }
    }
}

