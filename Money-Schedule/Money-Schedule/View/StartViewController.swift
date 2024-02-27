//
//  StartViewController.swift
//  Money-Schedule
//
//  Created by betty on 2024/02/27.
//

import UIKit
import SnapKit

class StartViewController: UIViewController {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.text = "가게부와 스케쥴을\n공유해보세요"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "사랑하는 사람과\n일정 관리를 더욱 편리하게\n간편하고 신속하게 공유해볼까요?"
        label.numberOfLines = 3
        label.textAlignment = .center
        label.textColor = .lightGray
        return label
    }()
    
    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .clear
        let image = UIImage(named: "Intro")
        imageView.image = image
        return imageView
    }()
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .clear
        let image = UIImage(named: "logo")
        imageView.image = image
        return imageView
    }()
    
    private let startButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("시작하기", for: .normal)
        button.backgroundColor = UIColor(hex: "23AA49", alpha: 1.0)
        button.titleLabel?.textColor = .white
        button.layer.cornerRadius = 16
        button.addTarget(
            self,
            action: #selector(startButtonTapped),
            for: .touchUpInside
        )
        return button
    }()
    
    @objc func startButtonTapped() {
        let searchViewController = ViewController2()
        searchViewController.modalPresentationStyle = .fullScreen
        self.present(searchViewController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    private func setupLayout() {
        view.addSubview(backgroundImageView)
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(logoImageView)
        view.addSubview(startButton)
        
        backgroundImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(12)
        }
        
        logoImageView.snp.makeConstraints { make in
            make.bottom.equalTo(titleLabel.snp.top).offset(-40)
            make.centerX.equalToSuperview()
        }
        
        startButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(subtitleLabel.snp.bottom).offset(24)
            make.height.equalTo(50)
            make.leading.equalToSuperview().offset(100)
            make.trailing.equalToSuperview().offset(-100)
        }
    }
}
