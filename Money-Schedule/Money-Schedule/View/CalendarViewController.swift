//
//  CalendarViewController.swift
//  Money-Schedule
//
//  Created by betty on 2024/02/29.
//

import UIKit
import FSCalendar
import SnapKit
import Then

class CalendarViewController: UIViewController {
    
    private lazy var viewtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 19)
        label.text = "일정"
        label.numberOfLines = 3
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    private let addButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "plus"), for: .normal)
        return button
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
    
    private var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.placeholder = "일정 검색"
        searchBar.searchBarStyle = .minimal
        searchBar.isHidden = true
        return searchBar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConfigure()
    }
    
    private func setupConfigure() {
        
        calendar.delegate = self
        calendar.dataSource = self
        
        view.backgroundColor = .white
        view.addSubview(viewtitleLabel)
        view.addSubview(addButton)
        view.addSubview(calendar)
        view.addSubview(searchBar)
        
        let searchButton = UIBarButtonItem(
            barButtonSystemItem: .search,
            target: self,
            action: #selector(searchButtonTapped)
        )

        searchButton.tintColor = .black
        
        navigationItem.leftBarButtonItem = searchButton
        
        viewtitleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(80)
        }
        
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
        
        searchBar.snp.makeConstraints { make in
             make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
             make.leading.trailing.equalToSuperview()
         }
    }
    
    @objc func searchButtonTapped() {
        searchBar.isHidden = !searchBar.isHidden
    }
    
    @objc func addButtonTapped() {
        print("Add button tapped!")
    }
}

extension CalendarViewController: FSCalendarDelegate, FSCalendarDataSource {
    
}
