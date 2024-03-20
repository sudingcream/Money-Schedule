//
//  ConnectSuccessViewController.swift
//  Money-Schedule
//
//  Created by suding on 3/13/24.
//

import UIKit
import RxSwift
import RxCocoa

class ConnectSuccessViewController: UIViewController {

    let disposeBag = DisposeBag()
  
    private lazy var dismissButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(dismissButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func dismissButtonTapped() {
        self.dismiss(animated: false)
    }
    
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
        let attributedString = NSMutableAttributedString(
            string: "연결 성공!"
        )
        attributedString.addAttribute(
            NSAttributedString.Key.kern,
            value: CGFloat(-1),
            range: NSRange(location: 0, length: attributedString.length)
        )
        label.attributedText = attributedString
        return label
    }()
    
    private lazy var myNickNameTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18)
        label.numberOfLines = 3
        label.textAlignment = .center
        label.textColor = .black
        
        let attributedString = NSMutableAttributedString(
            string: "내 별명"
        )
        attributedString.addAttribute(
            NSAttributedString.Key.kern,
            value: CGFloat(-1),
            range: NSRange(location: 0, length: attributedString.length)
        )
        label.attributedText = attributedString
        return label
    }()
    
    private lazy var  myNickNameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.attributedPlaceholder = NSAttributedString(
            string: "내 별명을 입력해주세요",
            attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16.0)]
        )
        textField.borderStyle = .none
        textField.backgroundColor = UIColor.clear
        return textField
    }()
    
    
    private lazy var myNickNameLine: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(hex: "23AA49", alpha: 1.0)
        return view
    }()
    
    private lazy var opponentNickNameTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18)
        label.numberOfLines = 3
        label.textAlignment = .center
        label.textColor = .black
        
        let attributedString = NSMutableAttributedString(
            string: "상대방 별명"
        )
        attributedString.addAttribute(
            NSAttributedString.Key.kern,
            value: CGFloat(-1),
            range: NSRange(location: 0, length: attributedString.length)
        )
        label.attributedText = attributedString
        return label
    }()
    
    private lazy var opponentNickNameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.attributedPlaceholder = NSAttributedString(
            string: "상대방 별명을 입력해주세요",
            attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16.0)]
        )
        textField.borderStyle = .none
        textField.backgroundColor = UIColor.clear
        return textField
    }()
    
    
    private lazy var opponentNickNameLine: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(hex: "23AA49", alpha: 1.0)
        return view
    }()
    
    private lazy var myBirthdayTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18)
        label.numberOfLines = 3
        label.textAlignment = .center
        label.textColor = .black
        
        let attributedString = NSMutableAttributedString(
            string: "내 생일"
        )
        attributedString.addAttribute(
            NSAttributedString.Key.kern,
            value: CGFloat(-1),
            range: NSRange(location: 0, length: attributedString.length)
        )
        label.attributedText = attributedString
        return label
    }()
    
    private lazy var myBirthdayTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.attributedPlaceholder = NSAttributedString(
            string: "2024.01.01",
            attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16.0)]
        )
        textField.borderStyle = .none
        textField.keyboardType = .phonePad
        textField.backgroundColor = UIColor.clear
        return textField
    }()
    
    private lazy var myBirthdayLine: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(hex: "23AA49", alpha: 1.0)
        return view
    }()
    
    private lazy var opponentBirthdayTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18)
        label.numberOfLines = 3
        label.textAlignment = .center
        label.textColor = .black
        
        let attributedString = NSMutableAttributedString(
            string: "상대방 생일"
        )
        attributedString.addAttribute(
            NSAttributedString.Key.kern,
            value: CGFloat(-1),
            range: NSRange(location: 0, length: attributedString.length)
        )
        label.attributedText = attributedString
        return label
    }()
    
    private lazy var opponentBirthdayTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.attributedPlaceholder = NSAttributedString(
            string: "2024.01.01",
            attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16.0)]
        )
        textField.borderStyle = .none
        textField.keyboardType = .phonePad
        textField.backgroundColor = UIColor.clear
        return textField
    }()
    
    private lazy var opponentBirthdayLine: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(hex: "23AA49", alpha: 1.0)
        return view
    }()
    
    
    private lazy var ourAnniversaryTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18)
        label.numberOfLines = 3
        label.textAlignment = .center
        label.textColor = .black
        
        let attributedString = NSMutableAttributedString(
            string: "우리 기념일"
        )
        attributedString.addAttribute(
            NSAttributedString.Key.kern,
            value: CGFloat(-1),
            range: NSRange(location: 0, length: attributedString.length)
        )
        label.attributedText = attributedString
        return label
    }()
    
    private lazy var ourAnniversaryTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.attributedPlaceholder = NSAttributedString(
            string: "2024.01.01",
            attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16.0)]
        )
        textField.borderStyle = .none
        textField.keyboardType = .phonePad
        textField.backgroundColor = UIColor.clear
        return textField
    }()
    
    private lazy var ourAnniversaryLine: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(hex: "23AA49", alpha: 1.0)
        return view
    }()
    
    private let startButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("확인", for: .normal)
        button.backgroundColor = UIColor(hex: "23AA49", alpha: 1.0)
        button.titleLabel?.textColor = .white
        button.layer.cornerRadius = 18
        button.addTarget(
            self,
            action: #selector(startButtonTapped),
            for: .touchUpInside
        )
        return button
    }()
    
    @objc func startButtonTapped() {
        let customTabBarController = CustomTabBarController()
        customTabBarController.modalPresentationStyle = .fullScreen
        self.present(
            customTabBarController,
            animated: true,
            completion: nil
        )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConfigure()
    }
    
    private func setupConfigure() {
        view.backgroundColor = .white
        
        view.addSubview(dismissButton)
        
        view.addSubview(logoImageView)
        view.addSubview(titleLabel)
        view.addSubview(myNickNameTitleLabel)
        view.addSubview(myNickNameTextField)
        view.addSubview(myNickNameLine)
        
        view.addSubview(opponentNickNameTitleLabel)
        view.addSubview(opponentNickNameTextField)
        view.addSubview(opponentNickNameLine)
        
        view.addSubview(myBirthdayTitleLabel)
        view.addSubview(myBirthdayTextField)
        view.addSubview(myBirthdayLine)
        
        view.addSubview(opponentBirthdayTitleLabel)
        view.addSubview(opponentBirthdayTextField)
        view.addSubview(opponentBirthdayLine)
        
        view.addSubview(ourAnniversaryTitleLabel)
        view.addSubview(ourAnniversaryTextField)
        view.addSubview(ourAnniversaryLine)
        
        view.addSubview(startButton)
        
        myBirthdayTextField.delegate = self
        opponentBirthdayTextField.delegate = self
        opponentBirthdayTextField.delegate = self
        
        
        dismissButton.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(80)
            make.leading.equalTo(view.snp.leading).offset(20)
            make.width.equalTo(25)
            make.height.equalTo(25)
        }
        
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
        
        myNickNameTitleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(30)
            make.top.equalTo(titleLabel.snp.bottom).offset(55)
        }
        
        myNickNameTextField.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(30)
            make.top.equalTo(myNickNameTitleLabel.snp.bottom).offset(9)
        }
        
        myNickNameTextField.font = UIFont.boldSystemFont(ofSize: 16.0)
        myNickNameTextField.textAlignment = .left
        
        myNickNameLine.snp.makeConstraints { make in
            make.top.equalTo(myNickNameTextField.snp.bottom).offset(9)
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
            make.height.equalTo(1.5)
        }
        
        opponentNickNameTitleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(30)
            make.top.equalTo(myNickNameLine.snp.bottom).offset(36)
        }
        
        opponentNickNameTextField.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(30)
            make.top.equalTo(opponentNickNameTitleLabel.snp.bottom).offset(9)
        }
        
        opponentNickNameTextField.font = UIFont.boldSystemFont(ofSize: 16.0)
        opponentNickNameTextField.textAlignment = .left
        
        opponentNickNameLine.snp.makeConstraints { make in
            make.top.equalTo(opponentNickNameTextField.snp.bottom).offset(9)
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
            make.height.equalTo(1.5)
        }
        
        myBirthdayTitleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(30)
            make.top.equalTo(opponentNickNameLine.snp.bottom).offset(36)
        }
        
        myBirthdayTextField.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(30)
            make.top.equalTo(myBirthdayTitleLabel.snp.bottom).offset(9)
        }
        
        myBirthdayTextField.font = UIFont.boldSystemFont(ofSize: 16.0)
        myBirthdayTextField.textAlignment = .left
        
        myBirthdayLine.snp.makeConstraints { make in
            make.top.equalTo(myBirthdayTextField.snp.bottom).offset(9)
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
            make.height.equalTo(1.5)
        }
        
        opponentBirthdayTitleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(30)
            make.top.equalTo(myBirthdayLine.snp.bottom).offset(36)
        }
        
        opponentBirthdayTextField.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(30)
            make.top.equalTo(opponentBirthdayTitleLabel.snp.bottom).offset(9)
        }
        
        opponentBirthdayTextField.font = UIFont.boldSystemFont(ofSize: 16.0)
        opponentBirthdayTextField.textAlignment = .left
        
        opponentBirthdayLine.snp.makeConstraints { make in
            make.top.equalTo(opponentBirthdayTextField.snp.bottom).offset(9)
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
            make.height.equalTo(1.5)
        }
        
        ourAnniversaryTitleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(30)
            make.top.equalTo(opponentBirthdayLine.snp.bottom).offset(36)
        }
        
        ourAnniversaryTextField.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(30)
            make.top.equalTo(ourAnniversaryTitleLabel.snp.bottom).offset(9)
        }
        
        ourAnniversaryTextField.font = UIFont.boldSystemFont(ofSize: 16.0)
        ourAnniversaryTextField.textAlignment = .left
        
        ourAnniversaryLine.snp.makeConstraints { make in
            make.top.equalTo(ourAnniversaryTextField.snp.bottom).offset(9)
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
            make.height.equalTo(1.5)
        }
        
        startButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.snp.bottom).offset(-50)
            make.height.equalTo(50)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
        }
    }
}

extension ConnectSuccessViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }

        let invalidCharacters = CharacterSet(charactersIn: "0123456789").inverted
        let range = string.rangeOfCharacter(from: invalidCharacters)

        if range != nil {
            return false
        }

        if text.count == 4 || text.count == 7 {
            textField.text?.append(".")
        }

        return text.count < 10
    }
}
