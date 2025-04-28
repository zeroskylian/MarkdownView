//
//  TintColorModifier.swift
//  MarkdownView
//
//  Created by Yanan Li on 2025/2/9.
//

import SwiftUI

extension View {
    /// Sets the tint color for specific MarkdownView component.
    ///
    /// - Parameters:
    ///   - tint: The tint color to apply.
    ///   - component: The tintable component to apply the tint color.
    @ViewBuilder
    nonisolated public func tint(
        _ tint: Color,
        for component: TintableComponent
    ) -> some View {
        switch component {
        case .blockQuote:
            environment(\.markdownRendererConfiguration.blockQuoteTintColor, tint)
        case .inlineCodeBlock:
            environment(\.markdownRendererConfiguration.inlineCodeTintColor, tint)
        case .link:
            environment(\.markdownRendererConfiguration.linkTintColor, tint)
        }
    }
}

/// Components that can apply a tint color.
@_documentation(visibility: internal)
public enum TintableComponent {
    case blockQuote
    case inlineCodeBlock
    case link
}
