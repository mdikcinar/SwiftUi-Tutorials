//
//  LandmarkCard.swift
//  tutorial
//
//  Created by mdikcinar-MacOS on 24.07.2022.
//

import SwiftUI

struct LandmarkCard: View {
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width:50, height:50)
            Text(landmark.name)
            Spacer()
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
     
    }
}

struct LandmarkCard_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks
    static var previews: some View {
        Group {
            LandmarkCard(landmark: landmarks[0])
            LandmarkCard(landmark: landmarks[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
