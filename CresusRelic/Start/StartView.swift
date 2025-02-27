//
//  StartView.swift
//  CresusRelic
//
//  Created by D K on 24.02.2025.
//

import SwiftUI

struct StartView: View {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some View {
        ZStack {
            HomeView()
        }
        .onAppear {
            AppDelegate.orientationLock = .portrait
            UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
            UINavigationController.attemptRotationToDeviceOrientation()
        }
    }
}

#Preview {
    StartView()
}
