//
//  LandmarkListPage.swift
//  tutorial
//
//  Created by mdikcinar-MacOS on 24.07.2022.
//

import SwiftUI

struct LandmarkListPage: View {
    @EnvironmentObject var modelData : ModelData
    
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks:[Landmark] {
        modelData.landmarks.filter{ landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView{
            List{
                Toggle(isOn: $showFavoritesOnly){
                    Text("Show favories only")
                }
                ForEach(filteredLandmarks){ landmark in
                        NavigationLink{
                            LandmarkDetailPage(landmark: landmark)
                        } label: {
                            LandmarkCard(landmark: landmark)
                        }
                    }
                }
            .navigationTitle("Landmarks")
        }
        
    }
}

struct LandmarkListPage_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(Constants.previewDeviceList, id: \.self){
            device in
            LandmarkListPage()
                .environmentObject(ModelData())
                .previewDevice(PreviewDevice(rawValue: device))
                .previewDisplayName(device)
        }
        
    }
}
