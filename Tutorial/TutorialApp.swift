//
//  lesson1App.swift
//  lesson1
//
//  Created by mdikcinar-MacOS on 24.07.2022.
//

import SwiftUI

@main
struct TutorialApp: App {
    @StateObject private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            LandmarkListPage()
                .environmentObject(modelData)
        }
    }
}
