//
//  FirstBackgroundView.swift
//  CresusRelic
//
//  Created by D K on 22.02.2025.
//

import SwiftUI

extension View {
    func size() -> CGSize {
        guard let window = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .zero
        }
        return window.screen.bounds.size
    }
}

struct FirstBackgroundView: View {
    var body: some View {
        Image("mainBG")
            .resizable()
            .ignoresSafeArea()
    }
}

struct SecondBackgroundView: View {
    var body: some View {
        Image("secondBG")
            .resizable()
            .ignoresSafeArea()
    }
}

#Preview {
    SecondBackgroundView()
}
