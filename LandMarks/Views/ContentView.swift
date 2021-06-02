//
//  ContentView.swift
//  LandMarks
//
//  Created by os_xuliran on 2021/4/22.
//

import SwiftUI

struct ContentView: View {
    
    
    @State private var selection: Tab = .featured
   
    enum Tab {
        case featured
        case list
    }
    var body: some View {
//        LandmarkList()
        TabView(selection: $selection,
                content:  {
                    CategoryHome()
                        .tag(Tab.featured)
                        .tabItem {
                            Label("Featured", systemImage: "star")
                        }
                    LandmarkList()
                        .tag(Tab.list)
                        .tabItem {
                            Label("List", systemImage: "list.bullet")
                        }
                    
                })

    }
}

struct ContentView_Previews: PreviewProvider {

    static var previews: some View {
        ContentView().environmentObject(ModelData())
    }
}
