//
//  ViewTypePublisher.swift
//  Pokedex
//
//  Created by Oguz Tandogan on 13.02.2024.
//

import Combine

enum ViewType {
    case uikit
    case swiftui
}

class ViewTypePublisher {
    var cancellables = Set<AnyCancellable>()

    var viewTypeSubject = PassthroughSubject<ViewType, Never>()

    init() {
        viewTypeSubject
            .sink { value in
                // Perform actions based on the received boolean value
                print(value)
            }
            .store(in: &cancellables)
    }

    deinit {
        cancellables.forEach { $0.cancel() }
    }
}
