//
//  MainTabBarController.swift
//  PhotoLibrary
//
//  Created by Тимур Ахметов on 07.05.2022.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let photosVC = PhotosCollectionViewController(collectionViewLayout: WaterfallLayout())
        
        let likesVC = LikesCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        
        viewControllers = [
            generateNavigationController(rootViewController: photosVC, title: "Photos", image: #imageLiteral(resourceName: "photos")),
            generateNavigationController(rootViewController: likesVC, title: "Favourites", image: #imageLiteral(resourceName: "heart"))
        ]
    }
    
    private func generateNavigationController(rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        return navigationVC
    }
}
