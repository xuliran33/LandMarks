//
//  RotatedBadgeSymbol.swift
//  LandMarks
//
//  Created by os_xuliran on 2021/4/30.
//

import SwiftUI

struct RotatedBadgeSymbol: View {
    let angle: Angle
    var body: some View {
        BadgeSymbol()
                    .padding(-60)
                    .rotationEffect(angle, anchor: .bottom)
            
    }
}

struct RotatedBadgeSymbol_Previews: PreviewProvider {
    static var previews: some View {
        RotatedBadgeSymbol(angle: Angle(degrees: 5))
    }
}
