//
//  LandmarkList.swift
//  LandMarks
//
//  Created by os_xuliran on 2021/4/23.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData:ModelData
    @State private var showFavirateOnly = false
    
    var filterLnadMarks:[Landmark]{
        modelData.landmarks.filter { (landmark) in
            (!showFavirateOnly || landmark.isFavorite)
        }
    }
    
    
    
    var body: some View {
        NavigationView{
            List{
                Toggle(isOn: $showFavirateOnly, label: {
                    Text("Favorites only")
                })
                ForEach(filterLnadMarks) { landmark in
                    ZStack{
                        NavigationLink( destination: LandmarkDetail(landMark: landmark)){
                            LandmarkRow(landMark: landmark)
                        }  
                    }
                    
      // 去除ListView的左边距
        .listRowInsets(EdgeInsets())
                }
                
            }
            .navigationTitle("Landmarks")
        }
        
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList().environmentObject(ModelData())
    }
}
