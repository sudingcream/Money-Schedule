//
//  TabItem.swift
//  Money-Schedule
//
//  Created by betty on 2024/02/29.
//

import UIKit

enum TabItem: Int, CaseIterable, Equatable {
    case home
    case money
    case calendar
    case setting
    
    var normalImage: UIImage? {
        switch self {
        case .home:
            return UIImage(named: "houseIcon")
        case .money:
            return UIImage(named: "card")
        case .calendar:
            return UIImage(named: "calendarIcon")
        case .setting:
            return UIImage(named: "settingIcon")
        }
    }
    
    var selectedImage: UIImage? {
        switch self {
        case .home:
            return UIImage(named: "selectedHouseIcon")
        case .money:
            return UIImage(named: "card_fill")
        case .calendar:
            return UIImage(named: "selectedCalendarIcon")
        case .setting:
            return UIImage(named: "selectedSettingIcon.pdf")
        }
    }
    
    var tabTitle: String? {
        switch self {
        case .home:
            return "홈"
        case .money:
            return "가계부"
        case .calendar:
            return "일정"
        case .setting:
            return "설정"
        }
    }
    
    var tabView: UIViewController {
        switch self {
        case .home:
            return HomeViewController()
        case .money:
            return MoneyViewController()
        case .calendar:
            return CalendarViewController()
        case .setting:
            return SettingViewController()
        }
    }
}
