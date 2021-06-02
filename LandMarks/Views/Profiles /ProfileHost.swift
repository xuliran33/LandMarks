//
//  ProfileHost.swift
//  LandMarks
//
//  Created by os_xuliran on 2021/5/8.
//

import SwiftUI

struct ProfileHost: View {
    @Environment(\.editMode) var editMode
    @State private var draftProfile = Profile.default
    @EnvironmentObject var modelData: ModelData
   
    
    var body: some View {
        VStack{
            HStack{
                Spacer()
                EditButton()
            }
            
            if editMode?.wrappedValue == .active{
                Button("cancel"){
                    draftProfile = modelData.profile;
                    editMode?.animation().wrappedValue = .inactive
                    
                }
            }
            
            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: modelData.profile)
            }else{
                ProfileEditor(profile: $draftProfile)
                    .onAppear{
                        draftProfile = modelData.profile
                    }
                    .onDisappear{
                        modelData.profile = draftProfile
                    }
            }
            /*else{
                /*switch editMode?.wrappedValue {
                case .inactive:
                    Text("inactive")
                case .transient:
                    Text("transient")
                case .active:
                    Text("active")
                default:
                    Text("")
                }*/
                ProfileEditor(profile: $draftProfile)
                
                
            }*/
            
            
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost().environmentObject(ModelData())
    }
}
