import Foundation

extension MarkdownView {
    var configuration: RendererConfiguration {
        RendererConfiguration(
            role: role,
            lineSpacing: lineSpacing,
            codeBlockThemeConfiguration: codeBlockThemeConfiguration,
            imageHandlerConfiguration: imageHandlerConfiguration,
            directiveBlockConfiguration: directiveBlockConfiguration,
            imageCacheController: imageCacheController
        )
    }
}

struct RendererConfiguration {
    var role: MarkdownView.MarkdownViewRole
    
    /// Sets the amount of space between lines in a paragraph in this view.
    ///
    /// Use SwiftUI's built-in `lineSpacing(_:)` to set the amount of spacing
    /// from the bottom of one line to the top of the next for text elements in the view.
    ///
    ///     MarkdownView(...)
    ///         .lineSpacing(10)
    var lineSpacing: CGFloat
    var componentSpacing: CGFloat = 12
    
    /// Sets the theme of the code block.
    /// For more information, please check out [raspu/Highlightr](https://github.com/raspu/Highlightr).
    var codeBlockThemeConfiguration: CodeBlockThemeConfiguration
    
    var imageHandlerConfiguration: ImageHandlerConfiguration
    var directiveBlockConfiguration: DirectiveBlockConfiguration
    var imageCacheController: ImageCacheController
}

extension RendererConfiguration: Equatable {
    static func == (lhs: RendererConfiguration, rhs: RendererConfiguration) -> Bool {
        lhs.codeBlockThemeConfiguration == rhs.codeBlockThemeConfiguration
    }
}
