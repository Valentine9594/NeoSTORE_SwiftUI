//
//  ContentView.swift
//  NeoSTORE-SwiftUI
//
//  Created by neosoft on 04/05/22.
//

import SwiftUI
import UIKit

struct PageViewController: UIViewControllerRepresentable {
    var controllers: [UIViewController]

    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal)

        return pageViewController
    }

    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers(
            [controllers[0]], direction: .forward, animated: true)
    }
    
//    static func dismantleUIViewController(_ pageViewController: UIPageViewController, coordinator: ()) {
//        pageViewController.n
//    }
}

struct ContentView: View {
    let aVC = UIViewController()
    let bVC = UIViewController()
    let cVC = UIViewController()
    var controllers: [UIViewController]
    
    init() {
        aVC.view.backgroundColor = .red
        bVC.view.backgroundColor = .green
        cVC.view.backgroundColor = .blue
        controllers = [aVC, bVC, cVC]
    }
    
    var body: some View {
        PageViewController(controllers: controllers)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
