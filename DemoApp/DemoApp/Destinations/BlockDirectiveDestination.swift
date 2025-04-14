//
//  BlockDirectiveDestination.swift
//  DemoApp
//
//  Created by LiYanan2004 on 2024/10/24.
//

import SwiftUI
import MarkdownView

@available(macOS 13.0, iOS 16.0, tvOS 16.0, watchOS 9.0, *)
struct BlockDirectiveDestination: View {
    @State private var text = #"""
    @note {
    This is a note directive block. You can use it to highlight important information or provide additional context to users.
    }
    """#
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Section {
                TextEditor(text: $text)
                    .scrollContentBackground(.hidden)
                    .font(.body)
                    .lineSpacing(6)
                    .padding(8)
                    .background(
                        .background,
                        in: .rect(cornerRadius: 12)
                    )
            } header: {
                Text("Markdown Text")
                    .font(.headline)
            }
            
            Divider()
            
            Section {
                MarkdownView(text)
                    .blockDirectiveRenderer(.note, for: "note")
            } header: {
                Text("MarkdownView")
                    .font(.headline)
            }
        }
    }
}

// MARK: - Custom Note Block Directive Provider

struct NoteBlockDirective: BlockDirectiveRenderer {
    func makeBody(configuration: Configuration) -> some View {
        Text(configuration.wrappedString)
            .padding(20)
            .background(
                .yellow,
                in: .rect(cornerRadius: 12)
            )
    }
}
 
// MARK: - Convenience

extension BlockDirectiveRenderer where Self == NoteBlockDirective {
    static var note: NoteBlockDirective { .init() }
}
