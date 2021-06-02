//
//  CategoryRow.swift
//  LandMarks
//
//  Created by os_xuliran on 2021/4/30.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [Landmark]
    var body: some View {
        VStack(alignment: .leading){
            Text(categoryName)
                            .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 15)
            ScrollView(.horizontal, showsIndicators: false){
                HStack(alignment: .top, spacing: 0){
                    ForEach(items) { landmark in
                        NavigationLink(
                            destination: LandmarkDetail(landMark: landmark)){
                            CategoryItem(landMark: landmark)
                        }
                        
                                 
                    }
                }
            }.frame(height: 185)
        }
    }
}

struct CategoryRow_Previews:
    PreviewProvider {
    static var previews: some View {
        var landmarks = ModelData().landmarks
        CategoryRow(categoryName: landmarks[0].category.rawValue, items: Array(landmarks.prefix(4))
        )
    }
}
