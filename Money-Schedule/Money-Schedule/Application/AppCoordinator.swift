//
//  AppCoordinator.swift
//  Money-Schedule
//
//  Created by betty on 2024/02/27.
//

import UIKit

// MARK: - Coordinator Protocol
//protocol Coordinator: AnyObject {
//    var childCoordinator: [Coordinator] { get set }
//    func start()
//}
//
//class AppCoordinator: Coordinator {
//    var childCoordinator: [Coordinator] = []
//    let window: UIWindow?
//
//    private var homeViewController: UIViewController!
//    private var secondViewController: UIViewController!
//    private var thirdViewController: UIViewController!
//
//    init(_ window: UIWindow?) {
//        self.window = window
//        window?.makeKeyAndVisible()
//    }
//
//    func start() {
//        let tabBarController = self.setTabBarController()
//        self.window?.rootViewController = tabBarController
//    }
//
//    func setTabBarController() -> UITabBarController {
//        let tabBarController = UITabBarController()
//
//        let firstItem = UITabBarItem(
//            title: "홈",
//            image: UIImage(systemName: "house.fill"),
//            tag: 0
//        )
//        let secondItem = UITabBarItem(
//            title: "가게부",
//            image: UIImage(systemName: "creditcard.fill"),
//            tag: 1
//        )
//        let thirdItem = UITabBarItem(
//            title: "일정",
//            image: UIImage(systemName: "calendar"),
//            tag: 2
//        )
//
//        let homeViewCoordinator = HomeViewCoordinator()
//        homeViewCoordinator.parentCoordinator = self
//        childCoordinator.append(homeViewCoordinator)
//        let homeViewController = homeViewCoordinator.startPush()
//        homeViewController.tabBarItem = firstItem
//
//        let moneyCoordinator = MoneyCoordinator()
//        moneyCoordinator.parentCoordinator = self
//        childCoordinator.append(moneyCoordinator)
//        let moneyViewController = moneyCoordinator.startPush()
//        moneyViewController.tabBarItem = secondItem
//
//        let calendarCoordinator = CalendarCoordinator()
//        calendarCoordinator.parentCoordinator = self
//        childCoordinator.append(calendarCoordinator)
//        let calendarViewController = calendarCoordinator.startPush()
//        calendarViewController.tabBarItem = thirdItem
//
//        tabBarController.viewControllers = [homeViewController, moneyViewController, calendarViewController]
//      
//        return tabBarController
//    }
//}
