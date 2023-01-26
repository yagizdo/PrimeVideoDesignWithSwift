//
//  BaseViewController.swift
//  PrimeVideoDesign
//
//  Created by Yılmaz Yağız Dokumacı on 26.01.2023.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Create appearence
        let appearence = UITabBarAppearance()
        appearence.backgroundColor = UIColor(named: "navbarBackgroundColor")
        
        // Change navbar item colors with changeNavbarItemColor func
        changeNavbarItemColor(itemAppearence: appearence.stackedLayoutAppearance)
        changeNavbarItemColor(itemAppearence: appearence.inlineLayoutAppearance)
        changeNavbarItemColor(itemAppearence: appearence.compactInlineLayoutAppearance)
        
        
        // Add appearence on navbar
        tabBarController?.tabBar.standardAppearance = appearence
        tabBarController?.tabBar.scrollEdgeAppearance = appearence
    }
    
    func changeNavbarItemColor(itemAppearence:UITabBarItemAppearance) {
        // Selected state
        itemAppearence.selected.iconColor = UIColor(named: "clickBlueColor")
        itemAppearence.selected.titleTextAttributes = [.foregroundColor: UIColor(named: "clickBlueColor")!]
        //itemAppearence.selected.badgeBackgroundColor = UIColor.systemMint
        
        // Unselected state
        itemAppearence.normal.iconColor = UIColor(named: "unselectedNavbarItemColor")
        itemAppearence.normal.titleTextAttributes = [.foregroundColor: UIColor(named: "unselectedNavbarItemColor")!]
        //itemAppearence.normal.badgeBackgroundColor = UIColor.lightGray
    }

}
