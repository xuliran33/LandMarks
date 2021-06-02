//
//  LandmarkRow.swift
//  LandMarks
//
//  Created by os_xuliran on 2021/4/23.
//

import SwiftUI

struct LandmarkRow: View {
    var landMark: Landmark
    var body: some View {
        HStack{
            landMark.image.resizable().frame(width: 50, height: 50)
            Text(landMark.name)
            Spacer()
            
            if landMark.isFavorite{
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }else{
                Image(systemName: "star")
                    .foregroundColor(.gray)
            }
        }
    }
    
}

struct LandmarkRow_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks
    static var previews: some View {
        Group{
            LandmarkRow(landMark: landmarks[1])
            LandmarkRow(landMark: landmarks[2])
            LandmarkRow(landMark: landmarks[3])
        }.previewLayout(.fixed(width: 300, height: 70))
        
            
    }
}
