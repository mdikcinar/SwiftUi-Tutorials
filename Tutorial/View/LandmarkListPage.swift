//
//  LandmarkListPage.swift
//  tutorial
//
//  Created by mdikcinar-MacOS on 24.07.2022.
//

import SwiftUI

struct LandmarkListPage: View {
    var landmarks : [Landmark]
    var body: some View {
        NavigationView{
            List(landmarks){ landmark in
                    NavigationLink{
                        LandmarkDetailPage(landmark: landmark)
                    } label: {
                        LandmarkCard(landmark: landmark)
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
            LandmarkListPage(landmarks: landmarks)
                .previewDevice(PreviewDevice(rawValue: device))
                .previewDisplayName(device)
        }
        
    }
}
