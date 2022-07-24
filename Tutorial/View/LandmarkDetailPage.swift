//
//  LandmarkDetailPage.swift
//  tutorial
//
//  Created by mdikcinar-MacOS on 24.07.2022.
//

import SwiftUI

struct LandmarkDetailPage: View {
    @EnvironmentObject var modelData: ModelData
    var landmark: Landmark
    
    
    var landmarkIndex: Int{
        modelData.landmarks.firstIndex(where: {$0.id == landmark.id}) ?? -1
    }
    
    var body: some View {
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height:300)
                .padding(.bottom,-130)
            CircleImage(image: landmark.image)
            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                        .foregroundColor(.black)
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
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
            LandmarkDetailPage(landmark: ModelData().landmarks[0])
                .previewDevice(PreviewDevice(rawValue: device))
                .previewDisplayName(device)
                .environmentObject(ModelData())
        }
        
    }
}
