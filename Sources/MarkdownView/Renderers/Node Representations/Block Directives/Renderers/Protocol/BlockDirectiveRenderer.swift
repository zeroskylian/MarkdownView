import SwiftUI
import Markdown

/// A type that renders block directives.
///
/// Think of this type as a SwiftUI View wrapper.
///
/// Don't directly access view dependencies (e.g. `@Environment`), use a separate view instead.
@preconcurrency
@MainActor
@_typeEraser(AnyBlockDirectiveRenderer)
public protocol BlockDirectiveRenderer {
    /// A view that represents the current block directive.
    associatedtype Body: SwiftUI.View
    
    /// Creates a view that represents the body of the block directive.
    ///
    /// - Parameter configuration: The properties of a block directive.
    @preconcurrency
    @MainActor
    @ViewBuilder
    func makeBody(configuration: Configuration) -> Body
    
    /// The properties of a block directive.
    typealias Configuration = BlockDirectiveRendererConfiguration
}

/// The properties of a block directive.
@preconcurrency
@MainActor
public struct BlockDirectiveRendererConfiguration: Sendable {
    /// The string wrapped in a block directive.
    public var wrappedString: String
    /// The arguments of a block directive.
    public var arguments: [Argument]
    
    /// Directive Block arguments represented from `swift-markdown/DirectiveArgument`.
    public struct Argument {
        /// The name of the argument.
        public var name: String
        
        /// The value of that argument.
        public var value: String
        
        /// An argument that represented from ``Markdown/DirectiveArgument``.
        /// - Parameter directiveArgument: The `DirectiveArgument` of the directive block.
        init(_ directiveArgument: DirectiveArgument) {
            name = directiveArgument.name
            value = directiveArgument.value
        }
    }
}

// MARK: - Type Erasure

/// A type-erasure for type conforms to `BlockDirectiveRenderer`.
public struct AnyBlockDirectiveRenderer: BlockDirectiveRenderer {
    public typealias Body = AnyView
    
    private let _makeBody: (Configuration) -> AnyView
    
    public init<T: BlockDirectiveRenderer>(erasing renderer: T) {
        _makeBody = {
            AnyView(renderer.makeBody(configuration: $0))
        }
    }
    
    public init<T: BlockDirectiveRenderer>(_ renderer: T) {
        _makeBody = {
            AnyView(renderer.makeBody(configuration: $0))
        }
    }
    
    public func makeBody(configuration: Configuration) -> Body {
        _makeBody(configuration)
    }
}
