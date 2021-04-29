//
//  MoviesAppApp.swift
//  MoviesApp
//
//  Created by Trenton Lazorchak on 4/29/21.
//

import SwiftUI

@main
struct MoviesAppApp: App {
    
    @StateObject var store = MovieStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView(store: store)
        }
    }
}
