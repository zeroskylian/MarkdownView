//
//  DemoAppApp.swift
//  DemoApp
//
//  Created by LiYanan2004 on 2024/10/23.
//

import SwiftUI

@main
struct DemoAppApp: App {
    var body: some Scene {
        WindowGroup {
            if #available(iOS 16, *) {
                ContentView()
            } else {
                ContentView15()
            }
        }
    }
}
