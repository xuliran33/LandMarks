//
//  CategoryItem.swift
//  LandMarks
//
//  Created by os_xuliran on 2021/4/30.
//

import SwiftUI

struct CategoryItem: View {
    var landMark: Landmark
    var body: some View {
        VStack(alignment: .leading){
            landMark.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
                
            Text(landMark.name)
                .font(.caption)
                .foregroundColor(.primary)
                
        }
        .padding(.leading, 15)
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(landMark: ModelData().landmarks[1])
    }
}
