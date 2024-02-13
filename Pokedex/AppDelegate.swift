//
//  AppDelegate.swift
//  Pokedex
//
//  Created by Oguz Tandogan on 9.02.2024.
//

import UIKit
import SwiftUI

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow()
        self.window = window
//        let hostingController = UIHostingController(rootView: PokemonListView())
//        window.rootViewController = hostingController
//        window.makeKeyAndVisible()
        MainView(window: window)
        return true
        //        let windowScene = UIWindowScene(session: session, connectionOptions: connectionOptions)
        //        self.window = UIWindow(windowScene: windowScene)
        ////        let navigationController = UINavigationController(rootViewController: PokemonListModule().createModule())
        ////        configureNavigationBar()
        //        if let window = window {
        //            window.rootViewController = navigationController
        //            window.makeKeyAndVisible()
        //        }
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

