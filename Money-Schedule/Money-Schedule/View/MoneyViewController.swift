//
//  MoneyViewController.swift
//  Money-Schedule
//
//  Created by betty on 2024/02/27.
//

import UIKit
import SnapKit
import FSCalendar

class MoneyViewController: UIViewController {
    
    private lazy var viewtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 19)
        label.text = "가계부"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    private let searchButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "search"), for: .normal)
        return button
    }()
    
    private let addButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "plus"), for: .normal)
        return button
    }()
    
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.placeholder = "검색"
        return searchBar
    }()
    
    
    private lazy var thisMonthtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.text = "이번달 지출 금액 : 434,230원"
        label.numberOfLines = 0
        label.textAlignment = .right
        label.textColor = .black
        return label
    }()
    
    private var calendar: FSCalendar = {
        let calendar = FSCalendar()
        calendar.translatesAutoresizingMaskIntoConstraints = false
        calendar.appearance.headerTitleColor = .black
        calendar.locale = Locale(identifier: "ko_KR")
        calendar.appearance.headerDateFormat = "YYYY년 MM월"
        calendar.appearance.headerMinimumDissolvedAlpha = 0.0
        calendar.appearance.todayColor = .lightGray
        calendar.appearance.weekdayTextColor = .black
        return calendar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        
        view.backgroundColor = .white
        view.addSubview(viewtitleLabel)
        
        //TODO: 추후 개발
//        view.addSubview(searchButton)
        view.addSubview(addButton)
        view.addSubview(calendar)
        view.addSubview(thisMonthtitleLabel)
        
        viewtitleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(80)
        }
        
        //TODO: 추후 개발
//        searchButton.snp.makeConstraints { make in
//            make.top.equalToSuperview().offset(70)
//            make.left.equalToSuperview().offset(24)
//        }
        
        addButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(70)
            make.right.equalTo(view.snp.right).offset(-24)
        }
 
        calendar.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(25)
            make.trailing.equalToSuperview().offset(-25)
            make.top.equalToSuperview().offset(215)
            make.height.equalTo(400)
        }
        
        thisMonthtitleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(calendar.snp.bottom).offset(24)
            make.trailing.equalToSuperview().offset(-25)
        }
    }
}

extension MoneyViewController: FSCalendarDelegate, FSCalendarDataSource {
    
}
