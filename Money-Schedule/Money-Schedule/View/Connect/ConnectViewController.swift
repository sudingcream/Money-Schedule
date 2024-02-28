//
//  ConnectViewController.swift
//  Money-Schedule
//
//  Created by betty on 2024/02/28.
//

import UIKit

class ConnectViewController: UIViewController {
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
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.text = "상대방 연결하기"
        label.numberOfLines = 3
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "연결할 상대방의 코드를 입력해주세요."
        label.numberOfLines = 3
        label.textAlignment = .center
        label.textColor = .lightGray
        return label
    }()
    
    private lazy var myCodeTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.text = "나의 코드"
        label.numberOfLines = 3
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    private lazy var myCodeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.text = "12312"
        label.numberOfLines = 3
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    private lazy var opponentCodeTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.text = "상대방 코드"
        label.numberOfLines = 3
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    private lazy var  opponentCodeTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.attributedPlaceholder = NSAttributedString(
            string: "00000",
            attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 24.0)]
        )
        textField.borderStyle = .none
        textField.keyboardType = .phonePad
        textField.backgroundColor = UIColor.clear
        return textField
    }()
    
    private let aloneStartButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("혼자 사용하기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.addTarget(
            self,
            action: #selector(aloneStartButtonTapped),
            for: .touchUpInside
        )
        return button
    }()
    
    @objc func aloneStartButtonTapped() {
        let homeViewController = HomeViewController()
        homeViewController.modalPresentationStyle = .fullScreen
        self.present(
            homeViewController,
            animated: true,
            completion: nil
        )
    }
    
    private let startButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("확인", for: .normal)
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
        let homeViewController = HomeViewController()
        homeViewController.modalPresentationStyle = .fullScreen
        self.present(
            homeViewController,
            animated: true,
            completion: nil
        )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConfigure()
        addUnderlineToButton()
    }
    
    private func setupConfigure() {
        view.backgroundColor = .white
        
        view.addSubview(logoImageView)
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(myCodeTitleLabel)
        view.addSubview(myCodeLabel)
        
        view.addSubview(opponentCodeTitleLabel)
        view.addSubview(opponentCodeTextField)
        
        view.addSubview(aloneStartButton)
        view.addSubview(startButton)
        
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
        
        subtitleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
        }
        
        myCodeTitleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(subtitleLabel.snp.bottom).offset(90)
        }
        
        myCodeLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(myCodeTitleLabel.snp.bottom).offset(9)
        }
        
        opponentCodeTitleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(myCodeLabel.snp.bottom).offset(70)
        }
        opponentCodeTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(opponentCodeTitleLabel.snp.bottom).offset(9)
        }
        
        opponentCodeTextField.font = UIFont.boldSystemFont(ofSize: 24.0)
        opponentCodeTextField.textAlignment = .center
        
        aloneStartButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(startButton.snp.top).offset(-16)
        }
        startButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.snp.bottom).offset(-66)
            make.height.equalTo(50)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
        }
    }
}

extension ConnectViewController {
    private func addUnderlineToButton() {
        let attributedString = NSMutableAttributedString(string: "혼자 사용하기")
        attributedString.addAttribute(
            .underlineStyle,
            value: NSUnderlineStyle.single.rawValue,
            range: NSRange(location: 0, length: attributedString.length)
        )
        aloneStartButton.setAttributedTitle(attributedString, for: .normal)
    }
}
