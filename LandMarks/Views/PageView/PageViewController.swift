//
//  PageViewController.swift
//  LandMarks
//
//  Created by os_xuliran on 2021/5/17.
//

import SwiftUI
import UIKit

struct PageViewController<Page: View>: UIViewControllerRepresentable {
    
    var pages: [Page]
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal
        )
        return pageViewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        if let pageViewController = uiViewController as? UIPageViewController {
            pageViewController.setViewControllers(
                               [UIHostingController(rootView: pages[0])], direction: .forward, animated: true)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject {
        var parent: PageViewController

        init(_ pageViewController: PageViewController) {
            parent = pageViewController
        }
    }


}
