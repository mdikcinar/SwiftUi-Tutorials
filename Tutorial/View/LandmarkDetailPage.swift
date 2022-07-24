//
//  LandmarkDetailPage.swift
//  tutorial
//
//  Created by mdikcinar-MacOS on 24.07.2022.
//

import SwiftUI

struct LandmarkDetailPage: View {
    var landmark: Landmark
    var body: some View {
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height:300)
                .padding(.bottom,-130)
            CircleImage(image: landmark.image)
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)
                    .foregroundColor(.black)
                Text(landmark.category)
                    .foregroundColor(.secondary)
                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            .padding()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct LandmarkDetailPage_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(Constants.previewDeviceList, id: \.self){
            device in
            LandmarkDetailPage(landmark: landmarks[0])
                .previewDevice(PreviewDevice(rawValue: device))
                .previewDisplayName(device)
        }
        
    }
}
