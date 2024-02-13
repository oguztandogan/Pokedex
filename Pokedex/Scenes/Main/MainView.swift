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
        switchToUIKit()
        self.viewTypeSubscriber.viewTypeSubject
            .sink { value in
                // Perform actions based on the received view type value
                switch value {
                    case .uikit:
                        print("Received UIKit view type in SomeOtherClass")
                        // Update view accordingly for UIKit in SomeOtherClass
                    case .swiftui:
                        print("Received SwiftUI view type in SomeOtherClass")
                        // Update view accordingly for SwiftUI in SomeOtherClass
                }
            }
            .store(in: &viewTypeSubscriber.cancellables)
    }
    
    private func switchToUIKit() {
        let navigationController = UINavigationController(rootViewController: PokemonListModule().createModule())
        configureNavigationBar()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    private func switchToSwiftUI() {
        let window = UIWindow()
        self.window = window
        let hostingController = UIHostingController(rootView: PokemonListView())
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


