//
//  CustomTabBarController.swift
//  Money-Schedule
//
//  Created by betty on 2024/02/29.
//

import UIKit
import SnapKit
import Then
import RxSwift
import RxCocoa

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.tintColor = .black
        self.tabBar.unselectedItemTintColor = .gray
        
        let homeVC = UINavigationController(rootViewController: HomeViewController())
        homeVC.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        homeVC.tabBarItem.title = "홈"
        homeVC.tabBarItem.image = UIImage(systemName: "house.fill")
        
        let moneyVC = MoneyViewController()
        moneyVC.tabBarItem.title = "가계부"
        moneyVC.tabBarItem.image = UIImage(systemName: "creditcard.fill")
        moneyVC.tabBarItem.selectedImage = UIImage(systemName: "gearshape.fill")
        
        let calendarVC = CalendarViewController()
        calendarVC.tabBarItem.title = "일정"
        calendarVC.tabBarItem.image = UIImage(systemName: "calendar")
        calendarVC.tabBarItem.selectedImage = UIImage(systemName: "gearshape.fill")
        
        let settingVC = SettingViewController()
        settingVC.tabBarItem.title = "설정"
        settingVC.tabBarItem.image = UIImage(systemName: "gearshape.fill")
        settingVC.tabBarItem.selectedImage = UIImage(systemName: "gearshape.fill")
        
        viewControllers = [homeVC, moneyVC, calendarVC, settingVC]
    }
}
