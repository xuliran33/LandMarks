//
//  CategoryHome.swift
//  LandMarks
//
//  Created by os_xuliran on 2021/4/30.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showingProfile = false
    var body: some View {
        NavigationView{
            List {
                modelData.features[1].image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }.listRowInsets(EdgeInsets())
            }
            .listStyle(InsetListStyle())
            .navigationTitle("Featured")
            .toolbar{
                Button(action: {showingProfile.toggle()}, label: {
                    Image(systemName: "person.crop.circle")
                        .accessibilityLabel("User Profile")
                })
            }
            .sheet(isPresented: $showingProfile, content: {
                ProfileHost().environmentObject(modelData)
            })
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome().environmentObject(ModelData())
    }
}
