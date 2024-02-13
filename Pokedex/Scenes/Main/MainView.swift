//
//  MainView.swift
//  Pokedex
//
//  Created by Oguz Tandogan on 13.02.2024.
//

import UIKit
import SwiftUI

class MainView {
    let viewTypeSubscriber = ViewTypePublisher()
    var window: UIWindow

    init(window: UIWindow) {
        self.window = window
        switchToSwiftUI()
        self.viewTypeSubscriber.viewTypeSubject
            .sink { value in
                switch value {
                case .uikit:
                    self.switchToUIKit()
                case .swiftui:
                    self.switchToSwiftUI()
                }
            }
            .store(in: &viewTypeSubscriber.cancellables)
    }
    
    private func switchToUIKit() {
        let navigationController = UINavigationController(rootViewController: PokemonListModule().createModule(viewTypeSubscriber: viewTypeSubscriber))
        configureNavigationBar()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    private func switchToSwiftUI() {
        let hostingController = UIHostingController(rootView: PokemonListView(viewTypePublisher: viewTypeSubscriber))
        window.rootViewController = hostingController
        window.makeKeyAndVisible()
    }
    
    private func configureNavigationBar() {
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithOpaqueBackground()
        navigationBarAppearance.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor : UIColor.white
        ]
        navigationBarAppearance.shadowColor = nil
        navigationBarAppearance.backgroundColor = UIColor(red: 151/255, green: 124/255, blue: 242/255, alpha: 1)
        UINavigationBar.appearance().barStyle = .default
        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
        UINavigationBar.appearance().compactAppearance = navigationBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
    }
}
