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

    var viewTypeSubject = CurrentValueSubject<ViewType, Never>(.uikit)

    init() {
        viewTypeSubject
            .sink { value in
            }
            .store(in: &cancellables)
    }

    deinit {
        cancellables.forEach { $0.cancel() }
    }
}
