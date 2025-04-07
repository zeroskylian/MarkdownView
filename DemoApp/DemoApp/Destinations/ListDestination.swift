//
//  ListDestination.swift
//  DemoApp
//
//  Created by LiYanan2004 on 2024/10/24.
//

import SwiftUI
import MarkdownView

@available(macOS 13.0, iOS 16.0, tvOS 16.0, watchOS 9.0, *)
struct ListDestination: View {
    @State private var text = """
    - Solar System Exploration
      - Planetary Missions
        - Mars Rover Program
        - Venus Atmospheric Studies
        - Jupiter Moon Probes
      - Asteroid Sampling
        - Near-Earth Objects
          - OSIRIS-REx Mission
          - Hayabusa2 Project
        - Main Belt Asteroids
          - Dawn Mission to Ceres
          - Psyche Metal World Study
    """
    
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
            } header: {
                Text("MarkdownView")
                    .font(.headline)
            }
        }
    }
}
