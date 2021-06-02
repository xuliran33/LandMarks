//
//  FavoriteButton.swift
//  LandMarks
//
//  Created by os_xuliran on 2021/4/26.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet : Bool
    var body: some View {
        Button(action: {
            isSet.toggle()
//            var alert = UIAlertController(title: "xxxx", message: "qqq", preferredStyle: .alert)
//                alert.addAction(UIAlertAction(title: "xxx", style: .default, handler: { _ in
//
//            }))
//            alert.addAction(UIAlertAction(title: "xxx", style: .default, handler: { _ in
//
//        }))
            
            
            
            
        }, label: {
            Image(systemName: isSet ? "star.fill" : "star") .foregroundColor(isSet ? Color.yellow : Color.gray)
        })
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
