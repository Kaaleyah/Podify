//
//  MainTabBarController.swift
//  Podify
//
//  Created by Furkan Can Baytemur on 10.01.2023.
//

import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UINavigationBar.appearance().prefersLargeTitles = true
        
        tabBar.tintColor = .orange
        tabBar.backgroundColor = .black
        
        setupViewController()
    }
    
    //MARK: - Setup functions
    
    func setupViewController() {
        viewControllers = [
            generateNavigationController(with: ViewController(), title: "Favorites", image: UIImage(named: "favorite")),
            generateNavigationController(with: ViewController(), title: "Search", image: UIImage(named: "search")),
            generateNavigationController(with: ViewController(), title: "Downloads", image: UIImage(named: "download"))
        ]
    }
    
    //MARK: - Helper functions
    
    fileprivate func generateNavigationController(with rootViewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        
        rootViewController.navigationItem.title = title
        
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        
        return navController
    }
}
