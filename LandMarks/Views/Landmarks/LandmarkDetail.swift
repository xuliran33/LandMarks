//
//  Detail.swift
//  LandMarks
//
//  Created by os_xuliran on 2021/4/23.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var modelData: ModelData
    var landMark:Landmark
    var landMarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landMark.id })!
    }
    var body: some View {
        ScrollView {
            VStack{
                MapView(coordinate: landMark.location).frame(height: 300)
                .ignoresSafeArea( edges: .top)
                CircleImage(image: landMark.image)
                    .offset(y: -130)
                    .padding(.bottom,-130)
                VStack (alignment: .leading){
                    HStack{
                        Text(landMark.name)
                            .font(.title)
                            .foregroundColor(.black)
                        
                        FavoriteButton(isSet: $modelData.landmarks[landMarkIndex].isFavorite)
                    }
                    HStack {
                        Text(landMark.park)
                            
                        Spacer()
                        Text(landMark.state)
                            
                    }.font(.subheadline)
                    .foregroundColor(.secondary)
                    
                    Divider()
                    Text("About \(landMark.name)")
                                        .font(.title2)
                        
                    Text(landMark.description)
                }.padding()
                Spacer()
            }.navigationTitle(landMark.name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct Detail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landMark: ModelData().landmarks[0])
    }
}
