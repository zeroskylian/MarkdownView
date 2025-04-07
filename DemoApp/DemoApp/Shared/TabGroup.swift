//
//  TabGroup.swift
//  DemoApp
//
//  Created by LiYanan2004 on 2024/10/24.
//

import Foundation

@available(macOS 13.0, iOS 16.0, tvOS 16.0, watchOS 9.0, *)
enum TabGroup: String, Codable, CaseIterable {
    case intro = "Intro"
    case interactive = "Try"
    case usage = "Demo"
    
    var tabs: [Tab] {
        switch self {
        case .intro:       [.overview]
        case .interactive: [.interact]
        case .usage:       [.text, .image, .list, .table, .customization, .blockDirective, .math, .stream]
        }
    }
}

// MARK: - Conformance: Identifiable
@available(macOS 13.0, iOS 16.0, tvOS 16.0, watchOS 9.0, *)
extension TabGroup: Identifiable {
    var id: Self { self }
}
