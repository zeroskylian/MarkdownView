//
//  InteractDestination.swift
//  DemoApp
//
//  Created by LiYanan2004 on 2024/10/24.
//

import SwiftUI
import MarkdownView

@available(macOS 13.0, iOS 16.0, tvOS 16.0, watchOS 9.0, *)
struct InteractDestination: View {
    @State private var text = ""
    @State private var enableMathRendering = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Section {
                TextEditor(text: $text)
                    .scrollContentBackground(.hidden)
                    .font(.body)
                    .lineSpacing(6)
//                    .containerRelativeFrame(.vertical, count: 3, span: 1, spacing: 20)
                    .padding(8)
                    .background(
                        .background,
                        in: .rect(cornerRadius: 12)
                    )
            } header: {
                HStack {
                    Text("Markdown Text")
                        .font(.headline)
                    Spacer(minLength: 20)
                    Toggle("Math Rendering", isOn: $enableMathRendering)
                }
            }
            
            Divider()
            
            Section {
                MarkdownView(text)
                    .markdownMathRenderingEnabled(enableMathRendering)
            } header: {
                Text("MarkdownView")
                    .font(.headline)
            }
        }
    }
}
