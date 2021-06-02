//
//  LandMarksApp.swift
//  LandMarks
//
//  Created by os_xuliran on 2021/4/22.
//

import SwiftUI
// App：表示App的结构和行为的类型
// 通过遵守App协议的结构体可以创建一个App，实现body的require方法来定义程序的内容
// @main为程序提供入口，该协议提供了mian（）方法的默认实现
// Sence用户界面的一部分，生命周期由系统管理
@main
struct LandMarksApp: App {
    // 可以在应用程序中声明状态，以便在所以场景中使用
    // 可以用StateObject属性初始化模型，然后在视图输入上将该模型作为ObservedObject或通过环境作为EnvironmentObject提供给应用程序中的场景

    @StateObject private var modelData = ModelData()
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        
        WindowGroup {
            ContentView().environmentObject(modelData)
        }
        // func onChange<V>(of value: V, perform action: @escaping (V) -> Void) -> some Scene where V : Equatable
        // value : 运行闭包时应该检查的值， 这个值要遵循Equatable 协议
        // action : 当value改变时运行的方法， 闭包提供一个新的值 newxxxx
        // 用Environment或Binding修饰，当值修改时可以触发该方法
        .onChange(of: scenePhase) { (newScenePhase) in
            if newScenePhase == .background{
                print("后台运行");
            }
            if newScenePhase == .active{
                print("开始运行或进入前台")
            }
            
            if newScenePhase == .inactive{
                // 就是程序中间切换的间隙
                print("程序挂起")
            }
        }
       
    }
}


struct MyScene: Scene {
    var body: some Scene{
        WindowGroup{
            ContentView()
        }
    }
}
