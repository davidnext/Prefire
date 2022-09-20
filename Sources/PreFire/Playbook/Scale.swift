//
//  ScaleModifier.swift
//  SnapshotAppSwiftUI (iOS)
//
//  Created by Maksim Grishutin on 16.08.2022.
//

import Foundation
import SwiftUI

struct ScaleModifier: ViewModifier {
    @State private var size: CGSize = .zero
    let scale: CGFloat

    func body(content: Content) -> some View {
        content
            .background(
                GeometryReader { proxy in
                    Color.clear
                        .onAppear {
                            size = proxy.size
                        }
                },
                alignment: .center
            )
            .scaleEffect(scale)
            .frame(width: size.width * scale, height: size.height * scale)
    }
}

// MARK: - ScaleEffectButtonStyle

struct ScaleEffectButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 0.9 : 1.0)
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .animation(.linear(duration: 0.15), value: configuration.isPressed)
    }
}