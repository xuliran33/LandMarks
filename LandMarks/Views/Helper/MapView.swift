//
//  MapView.swift
//  LandMarks
//
//  Created by os_xuliran on 2021/4/22.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    
    var coordinate : CLLocationCoordinate2D
    var body: some View {
        Map(coordinateRegion: $region)
        
    }
    
    private func setRegion(coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
            )
    }
}

struct MapView_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks

    static var previews: some View {
        MapView(coordinate: landmarks[0].location)
    }
}
