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
        button.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func addButtonTapped() {
        let addSpendingViewController = AddSpendingViewController()
        addSpendingViewController.modalPresentationStyle = .fullScreen
        self.present(
            addSpendingViewController,
            animated: true,
            completion: nil
        )
    }
    
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.placeholder = "검색"
        return searchBar
    }()
    
    private lazy var thismonthIncomeTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "NotoSansKR-Thin", size: 11)
        label.numberOfLines = 0
        label.textAlignment = .left
        
        let text = "이번달 수입 : "
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(
            .kern,
            value: CGFloat(-1),
            range: NSRange(location: 0, length: attributedString.length)
        )
        
        label.attributedText = attributedString
        label.textColor = UIColor(hex: "77757F")
        return label
    }()
    
    private lazy var thismonthIncomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "NotoSansKR-Thin", size: 11)
        label.numberOfLines = 0
        label.textAlignment = .left
        
        let text = "461,000원"
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(
            .kern,
            value: CGFloat(-1),
            range: NSRange(location: 0, length: attributedString.length)
        )
        
        label.attributedText = attributedString
        label.textColor = UIColor(hex: "23AA49")
        return label
    }()
    
    private lazy var thismonthSpendingTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .left
        
        let text = "이번달 지출 : "
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(
            .kern,
            value: CGFloat(-1),
            range: NSRange(location: 0, length: attributedString.length)
        )
        
        label.attributedText = attributedString
        label.font = UIFont(name: "NotoSansKR-Thin", size: 11)
        label.textColor = UIColor(hex: "77757F")
        return label
    }()
    private lazy var thismonthSpendingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .left
        
        let text = "43,300원"
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(
            .kern,
            value: CGFloat(-1),
            range: NSRange(location: 0, length: attributedString.length)
        )
        
        label.attributedText = attributedString
        label.font = UIFont(name: "NotoSansKR-Thin", size: 11)
        label.textColor = UIColor(hex: "FF6D6D")
        return label
    }()

    private lazy var dividerLine: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(hex: "E9E6E6", alpha: 1.0)
        return view
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
        view.addSubview(thismonthIncomeTitleLabel)
        view.addSubview(thismonthSpendingTitleLabel)
        view.addSubview(thismonthIncomeLabel)
        view.addSubview(thismonthSpendingLabel)
        view.addSubview(dividerLine)
        
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
        thismonthIncomeTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(viewtitleLabel.snp.bottom).offset(40)
            make.right.equalToSuperview().offset(-100)
        }
        
        thismonthIncomeLabel.snp.makeConstraints { make in
            make.top.equalTo(viewtitleLabel.snp.bottom).offset(40)
            make.right.equalToSuperview().offset(-14)
        }
        
        thismonthSpendingTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(thismonthIncomeTitleLabel.snp.bottom).offset(22)
            make.right.equalToSuperview().offset(-100)
        }
        thismonthSpendingLabel.snp.makeConstraints { make in
            make.top.equalTo(thismonthIncomeTitleLabel.snp.bottom).offset(22)
            make.right.equalToSuperview().offset(-14)
        }
        dividerLine.snp.makeConstraints { make in
            make.top.equalTo(thismonthSpendingLabel.snp.bottom).offset(14)
            make.height.equalTo(1)
            make.left.right.equalToSuperview()
        }
        calendar.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(25)
            make.trailing.equalToSuperview().offset(-25)
            make.top.equalTo(dividerLine.snp.bottom).offset(40)
            make.height.equalTo(400)
        }
    }
}

extension MoneyViewController: FSCalendarDelegate, FSCalendarDataSource {
    
}
