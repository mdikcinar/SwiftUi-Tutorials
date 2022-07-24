//
//  ModelData.swift
//  tutorial
//
//  Created by mdikcinar-MacOS on 24.07.2022.
//
import Combine

final class ModelData: ObservableObject{
   @Published var landmarks: [Landmark] = load(Constants.landMarkJsonPath)
}
