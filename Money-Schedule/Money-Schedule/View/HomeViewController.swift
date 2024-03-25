//
//  HomeViewController.swift
//  Money-Schedule
//
//  Created by betty on 2024/02/27.
//

import UIKit

class HomeViewController: UIViewController {
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .clear
        let image = UIImage(named: "ColorLogo")
        imageView.image = image
        return imageView
    }()
    
    private lazy var viewtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "NotoSansKR-Thin", size: 50)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = UIColor(hex: "225C4B")
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.dateFormat = "yyyy년 M월 d일 EEEE"
        let dateString = dateFormatter.string(from: Date())
        
        let attributedString = NSMutableAttributedString(string: dateString)
        attributedString.addAttribute(
            .kern,
            value: CGFloat(-1),
            range: NSRange(location: 0, length: attributedString.length)
        )
        
        label.attributedText = attributedString
        return label
    }()

    private lazy var todayScheduleView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: "EEEFF5").withAlphaComponent(0.6)
        view.layer.cornerRadius = 20
        return view
    }()
    
    private lazy var todayScheduleLogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .clear
        let image = UIImage(named: "calendar")
        imageView.image = image
        return imageView
    }()
    
    private lazy var todayScheduleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "NotoSansKR-Thin", size: 22)
        label.numberOfLines = 0
        label.textAlignment = .center
        
        let text = "오늘의 주요 일정"
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
    
    private lazy var todayScheduleFirstLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "NotoSansKR-Thin", size: 22)
        label.numberOfLines = 0
        label.textAlignment = .center
        
        let text = "오후 7시 민정이 약속"
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
    
    private lazy var todayScheduleSecondLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "NotoSansKR-Thin", size: 22)
        label.numberOfLines = 0
        label.textAlignment = .center
        
        let text = "오후 10시 테니스"
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
    
    private lazy var todayScheduleThirdLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "NotoSansKR-Thin", size: 22)
        label.numberOfLines = 0
        label.textAlignment = .center
        
        let text = "오후 11시 회의"
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
    
    
    private lazy var todaySpendView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: "EEEFF5").withAlphaComponent(0.6)
        view.layer.cornerRadius = 20
        return view
    }()
    
    private lazy var todaySpendLogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .clear
        let image = UIImage(named: "spend")
        imageView.image = image
        return imageView
    }()
    
    private lazy var todaySpendLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "NotoSansKR-Thin", size: 22)
        label.numberOfLines = 0
        label.textAlignment = .center
        
        let text = "오늘 지출 금액 순위"
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
    
    private lazy var todaySpendFirstLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "NotoSansKR-Thin", size: 22)
        label.numberOfLines = 0
        label.textAlignment = .center
        
        let text = "14,300원 샐러드"
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
    
    private lazy var todaySpendSecondLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "NotoSansKR-Thin", size: 22)
        label.numberOfLines = 0
        label.textAlignment = .center
        
        let text = "4,300원 택시비"
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
    
    private lazy var todaySpendThirdLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "NotoSansKR-Thin", size: 22)
        label.numberOfLines = 0
        label.textAlignment = .center
        
        let text = "2,300원 편의점"
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConfigure()
        view.backgroundColor = .white
    }
    
    private func setupConfigure() {
        view.addSubview(logoImageView)
        view.addSubview(viewtitleLabel)
        
        view.addSubview(todayScheduleView)
        todayScheduleView.addSubview(todayScheduleLabel)
        todayScheduleView.addSubview(todayScheduleLogoImageView)
        todayScheduleView.addSubview(todayScheduleFirstLabel)
        todayScheduleView.addSubview(todayScheduleSecondLabel)
        todayScheduleView.addSubview(todayScheduleThirdLabel)
        
        view.addSubview(todaySpendView)
        todaySpendView.addSubview(todaySpendLabel)
        todaySpendView.addSubview(todaySpendLogoImageView)
        todaySpendView.addSubview(todaySpendFirstLabel)
        todaySpendView.addSubview(todaySpendSecondLabel)
        todaySpendView.addSubview(todaySpendThirdLabel)
        
        logoImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(80)
            make.left.equalTo(view.snp.left).offset(24)
            make.height.equalTo(35)
            make.width.equalTo(35)
        }
        
        viewtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(26)
            make.left.equalTo(view.snp.left).offset(24)
        }
        
        todayScheduleView.snp.makeConstraints { make in
            make.height.equalTo(190)
            make.top.equalTo(viewtitleLabel.snp.bottom).offset(26)
            make.left.equalToSuperview().offset(27)
            make.right.equalToSuperview().offset(-27)
        }
        
        todayScheduleLogoImageView.snp.makeConstraints { make in
            make.width.height.equalTo(35)
            make.top.equalTo(todayScheduleView.snp.top).offset(17)
            make.left.equalTo(todayScheduleView.snp.left).offset(20)
        }
        
        todayScheduleLabel.snp.makeConstraints { make in
            make.top.equalTo(todayScheduleView.snp.top).offset(23)
            make.left.equalTo(todayScheduleLogoImageView.snp.right).offset(11)
        }
        todayScheduleFirstLabel.snp.makeConstraints { make in
            make.top.equalTo(todayScheduleLabel.snp.bottom).offset(31)
            make.left.equalTo(todayScheduleView.snp.left).offset(20)
        }
        todayScheduleSecondLabel.snp.makeConstraints { make in
            make.top.equalTo(todayScheduleFirstLabel.snp.bottom).offset(15)
            make.left.equalTo(todayScheduleView.snp.left).offset(20)
        }
        todayScheduleThirdLabel.snp.makeConstraints { make in
            make.top.equalTo(todayScheduleSecondLabel.snp.bottom).offset(15)
            make.left.equalTo(todayScheduleView.snp.left).offset(20)
        }
        todaySpendView.snp.makeConstraints { make in
            make.height.equalTo(190)
            make.left.equalToSuperview().offset(27)
            make.right.equalToSuperview().offset(-27)
            make.top.equalTo(todayScheduleView.snp.bottom).offset(50)
        }
        
        todaySpendLogoImageView.snp.makeConstraints { make in
            make.width.height.equalTo(35)
            make.top.equalTo(todaySpendView.snp.top).offset(17)
            make.left.equalTo(todaySpendView.snp.left).offset(20)
        }
        
        todaySpendLabel.snp.makeConstraints { make in
            make.top.equalTo(todaySpendView.snp.top).offset(23)
            make.left.equalTo(todaySpendLogoImageView.snp.right).offset(11)
        }
        
        todaySpendFirstLabel.snp.makeConstraints { make in
            make.top.equalTo(todaySpendLabel.snp.bottom).offset(31)
            make.left.equalTo(todaySpendView.snp.left).offset(20)
        }
        todaySpendSecondLabel.snp.makeConstraints { make in
            make.top.equalTo(todaySpendFirstLabel.snp.bottom).offset(15)
            make.left.equalTo(todaySpendView.snp.left).offset(20)
        }
        todaySpendThirdLabel.snp.makeConstraints { make in
            make.top.equalTo(todaySpendSecondLabel.snp.bottom).offset(15)
            make.left.equalTo(todaySpendView.snp.left).offset(20)
        }
    }
}
