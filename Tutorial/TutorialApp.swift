//
//  lesson1App.swift
//  lesson1
//
//  Created by mdikcinar-MacOS on 24.07.2022.
//

import SwiftUI

var landmarks: [Landmark] = load(Constants.landMarkJsonPath)

@main
struct TutorialApp: App {
    var body: some Scene {
        WindowGroup {
            LandmarkListPage(landmarks: landmarks)
        }
    }
}
