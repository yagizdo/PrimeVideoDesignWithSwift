//
//  BaseViewController.swift
//  PrimeVideoDesign
//
//  Created by Yılmaz Yağız Dokumacı on 26.01.2023.
//

import UIKit
import LZViewPager

class HomeViewController: UIViewController {

    @IBOutlet weak var viewPager: LZViewPager!
    
    private var tabs:[UIViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add prime video logo on navigation title
        let primeVideoLogoImage = UIImage(named: "primeVideoLogo")
        
        let titleLogoImageView = UIImageView(image: primeVideoLogoImage)
        
        titleLogoImageView.contentMode = .scaleAspectFit
        
        titleLogoImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        self.navigationItem.titleView = titleLogoImageView
        
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
        
        viewPagerProperties()

        // Remove thin line on top of tab bar
        self.tabBarController?.tabBar.standardAppearance.configureWithTransparentBackground()
        self.tabBarController?.tabBar.clipsToBounds = true
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


 
// Tab bar
extension HomeViewController : LZViewPagerDelegate, LZViewPagerDataSource {

    func viewPagerProperties() {
        self.viewPager.delegate = self
        self.viewPager.dataSource = self
        self.viewPager.hostController = self
        
        let homeTab = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeTabViewController") as! HomeTabViewController
        homeTab.title = "Home"
        
        let originalsTab = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TVShowsViewController") as! TVShowsViewController
        originalsTab.title = "TV Shows"
        
        let MoviesTab = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MoviesTabViewController") as! MoviesTabViewController
        MoviesTab.title = "Movies"

        
        let KidsTab = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "KidsTabViewController") as! KidsTabViewController
        KidsTab.title = "Kids"

        tabs = [homeTab,originalsTab,MoviesTab,KidsTab]
        viewPager.reload()
    }
    
    func numberOfItems() -> Int {
        return tabs.count
    }
    
    func controller(at index: Int) -> UIViewController {
        return tabs[index]
    }
    
    func button(at index: Int) -> UIButton {
            let button = UIButton()
            button.setTitleColor(UIColor(named: "unselectedNavbarItemColor"), for: .normal)
            button.setTitleColor(UIColor.white, for: .selected)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .medium)
            return button
        
        
    }
    
    func backgroundColorForHeader() -> UIColor {
        return UIColor(named: "backgroundColor")!
    }
    
    func colorForIndicator(at index: Int) -> UIColor {
        return UIColor.white
    }
    
    func heightForHeader() -> CGFloat {
        return 35
    }
    
    func shouldEnableSwipeable() -> Bool {
        return false
    }
    
    func leftMarginForHeader() -> CGFloat {
        return 15
    }
    
    func rightMarginForHeader() -> CGFloat {
        return 15
    }
    
    func widthForIndicator(at index: Int) -> CGFloat {
        return 60
    }
    
    func heightForIndicator() -> CGFloat {
        return 4
    }
    
    
}
