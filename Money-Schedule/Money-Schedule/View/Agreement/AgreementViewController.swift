//
//  AgreementViewController.swift
//  Money-Schedule
//
//  Created by suding on 3/3/24.
//

import UIKit

class AgreementViewController: UIViewController {
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .clear
        let image = UIImage(named: "ColorLogo")
        imageView.image = image
        return imageView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.numberOfLines = 3
        label.textAlignment = .center
        label.textColor = .black

        let attributedString = NSMutableAttributedString(string: "개인정보 처리 방침 동의")
        attributedString.addAttribute(NSAttributedString.Key.kern, value: CGFloat(-2), range: NSRange(location: 0, length: attributedString.length))
        label.attributedText = attributedString

        return label
    }()
    
    private let allAgreeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "checkmark"), for: .normal)
        
        button.layer.cornerRadius = 16
        button.addTarget(
            self,
            action: #selector(allAgreeButtonTapped),
            for: .touchUpInside
        )
        
        button.titleLabel?.font = .systemFont(ofSize: 14)
        button.setTitle(" 모두 동의하기", for: .normal)
        button.setTitleColor(UIColor(hex: "777777", alpha: 1.0), for: .normal)
        button.setTitleColor(UIColor(hex: "23AA49", alpha: 1.0), for: .highlighted)
        button.setImage(UIImage(named: "check"), for: .normal)
        button.layer.borderColor = UIColor(hex: "777777").cgColor
        button.layer.borderWidth = 1

        // 높이 제약조건 추가
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        return button
    }()

    @objc func allAgreeButtonTapped() {
    }
    
    private let privateAgreeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "checkmark"), for: .normal)
        
        button.layer.cornerRadius = 16
        button.addTarget(
            self,
            action: #selector(allAgreeButtonTapped),
            for: .touchUpInside
        )
        
        button.titleLabel?.font = .systemFont(ofSize: 14)
        button.setTitle(" 모두 동의하기", for: .normal)
        button.setTitleColor(UIColor(hex: "777777", alpha: 1.0), for: .normal)
        button.setTitleColor(UIColor(hex: "23AA49", alpha: 1.0), for: .highlighted)
        button.setImage(UIImage(named: "check"), for: .normal)
        button.layer.borderColor = UIColor(hex: "777777").cgColor
        button.layer.borderWidth = 1

        // 높이 제약조건 추가
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConfigure()
    }
    
    private func setupConfigure() {
        view.backgroundColor = .white
        view.addSubview(logoImageView)
        view.addSubview(titleLabel)
        view.addSubview(allAgreeButton)
        
        logoImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.centerX.equalToSuperview()
            make.height.equalTo(66)
            make.width.equalTo(66)
        }
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(logoImageView.snp.bottom).offset(16)
        }
        
        allAgreeButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
            make.top.equalTo(titleLabel.snp.bottom).offset(40)
        }
    }
}
