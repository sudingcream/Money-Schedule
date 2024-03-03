//
//  ContactViewController.swift
//  Money-Schedule
//
//  Created by betty on 2024/02/28.
//

import UIKit

class ContactViewController: UIViewController, UITextFieldDelegate {
    
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
        let image = UIImage(named: "logo")
        imageView.image = image
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.text = "전화번호를\n입력하세요!"
        label.numberOfLines = 3
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "사랑하는 사람과 공유할 때 사용됩니다"
        label.numberOfLines = 3
        label.textAlignment = .center
        label.textColor = .lightGray
        return label
    }()
    
    private lazy var phonenumberTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.attributedPlaceholder = NSAttributedString(
            string: "010-0000-0000",
            attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 24.0)]
        )
        textField.borderStyle = .none
        textField.keyboardType = .phonePad
        textField.placeholder = "010-0000-0000"
        textField.textColor = .black
        textField.layer.cornerRadius = 12
        return textField
    }()
    
    private let startButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("계속하기", for: .normal)
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
        let contactViewController = ConnectViewController()
        contactViewController.modalPresentationStyle = .fullScreen
        self.present(
            contactViewController,
            animated: true,
            completion: nil
        )
    }
    
    private lazy var noticetitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 11)
        label.text = "\"계속하기\"를 클릭함으로써 이용약관에 동의하시는 것입니다."
        label.numberOfLines = 3
        label.textAlignment = .center
        label.textColor = .lightGray
        return label
    }()
    
    @objc private func dismissKeyboard() {
         view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConfigure()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
        phonenumberTextField.delegate = self
        view.backgroundColor = .white
    }
    
    private func setupConfigure() {
        view.addSubview(dismissButton)
        view.addSubview(logoImageView)
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(startButton)
        view.addSubview(phonenumberTextField)
        
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
        
        subtitleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
        }
        
        phonenumberTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(subtitleLabel.snp.bottom).offset(48)
        }
        
        phonenumberTextField.font = UIFont.boldSystemFont(ofSize: 24.0)
        phonenumberTextField.textAlignment = .center
        
        startButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(phonenumberTextField.snp.bottom).offset(56)
            make.height.equalTo(50)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
        }
    }
}

extension ContactViewController {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text, let textRange = Range(range, in: text) else {
            return true
        }
        let updatedText = text.replacingCharacters(in: textRange, with: string)
        
        if updatedText.count > 13 {
            return false
        }
        
        let digitString = updatedText.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        
        let hyphenIndices = [3, 7]
        
        var formattedText = ""
        for (index, character) in digitString.enumerated() {
            formattedText.append(character)
            if hyphenIndices.contains(index + 1) && index != digitString.count - 1 {
                formattedText.append("-")
            }
        }
        
        textField.text = formattedText
        return false
    }
}
