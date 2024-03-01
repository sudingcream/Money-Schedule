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
        label.font = UIFont.boldSystemFont(ofSize: 19)
        label.text = "우연님 반갑습니다!"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .black
        return label
    }()
    
    private lazy var todayScheduleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 19)
        label.text = "오늘의 주요 일정 ☘️"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    private lazy var todaySpendLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 19)
        label.text = "오늘 지출 금액 순위 🔥"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .black
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
        view.addSubview(todayScheduleLabel)
        view.addSubview(todaySpendLabel)
        
        logoImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(80)
            make.left.equalTo(view.snp.left).offset(24)
            make.height.equalTo(35)
            make.width.equalTo(35)
        }
        
        viewtitleLabel.snp.makeConstraints { make in
            make.left.equalTo(logoImageView.snp.right).offset(10)
            make.top.equalToSuperview().offset(90)
        }
        
        todayScheduleLabel.snp.makeConstraints { make in
            make.top.equalTo(viewtitleLabel.snp.bottom).offset(120)
            make.left.equalTo(view.snp.left).offset(24)
        }
        
        todaySpendLabel.snp.makeConstraints { make in
            make.top.equalTo(todayScheduleLabel.snp.bottom).offset(120)
            make.left.equalTo(view.snp.left).offset(24)
        }
    }
}
