//
//  CarouselView.swift
//  NeoSTORE-SwiftUI
//
//  Created by neosoft on 13/05/22.
//

import UIKit
import SwiftUI

struct PageViewController<Page: View>: UIViewControllerRepresentable{
    var pages: [Page]
    @Binding var currentPageNumber: Int
    
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        pageViewController.dataSource = context.coordinator
        pageViewController.delegate = context.coordinator
        return pageViewController
    }
    
    func updateUIViewController(_ uiViewController: UIPageViewController, context: Context) {
        uiViewController.setViewControllers([context.coordinator.controllers[currentPageNumber]], direction: .forward, animated: true)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate{
        var parent: PageViewController
        var controllers = [UIViewController]()
        
        init(_ pageViewController: PageViewController){
            self.parent = pageViewController
            controllers = parent.pages.map{ UIHostingController(rootView: $0) }
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?{
            guard let index = controllers.firstIndex(of: viewController) else{
                return nil
            }
            if index == 0{
                return controllers.last
            }
            return controllers[index-1]
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?{
            guard let index = controllers.firstIndex(of: viewController) else{
                return nil
            }
            if index + 1 == controllers.count{
                return controllers.first
            }
            return controllers[index+1]
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
            if completed, let visibileViewController = pageViewController.viewControllers?.first, let visiblePageIndex = pageViewController.viewControllers?.firstIndex(of: visibileViewController){
                parent.currentPageNumber = visiblePageIndex
            }
        }
    }
    
}
