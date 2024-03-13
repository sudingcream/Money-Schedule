//
//  ConnectViewController.swift
//  Money-Schedule
//
//  Created by betty on 2024/02/28.
//

import UIKit
import RxSwift
import RxCocoa

class ConnectViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    let pasteBoard = UIPasteboard.general
    
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
            string: "상대방 연결하기"
        )
        attributedString.addAttribute(
            NSAttributedString.Key.kern,
            value: CGFloat(-1),
            range: NSRange(location: 0, length: attributedString.length)
        )
        label.attributedText = attributedString
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 3
        label.textAlignment = .center
        label.textColor = .lightGray
        let attributedString = NSMutableAttributedString(
            string: "연결할 상대방의 코드를 입력해주세요."
        )
        attributedString.addAttribute(
            NSAttributedString.Key.kern,
            value: CGFloat(-1),
            range: NSRange(location: 0, length: attributedString.length)
        )
        label.attributedText = attributedString
        return label
    }()
    
    private lazy var myCodeTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18)
        label.numberOfLines = 3
        label.textAlignment = .center
        label.textColor = .black        
        let attributedString = NSMutableAttributedString(
            string: "나의 연결코드"
        )
        attributedString.addAttribute(
            NSAttributedString.Key.kern,
            value: CGFloat(-1),
            range: NSRange(location: 0, length: attributedString.length)
        )
        label.attributedText = attributedString
        return label
    }()
    
    private lazy var myCodeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "12312"
        label.numberOfLines = 3
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    private lazy var line: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(hex: "23AA49", alpha: 1.0)
        return view
    }()
    
    private let copyButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "copy"), for: .normal)
        button.addTarget(
            self,
            action: #selector(copyTapped),
            for: .touchUpInside
        )
        return button
    }()
    
    @objc func copyTapped() {
        pasteBoard.string = myCodeLabel.text
        self.showToast(message: "클립보드에 복사되었습니다.")
    }

    private lazy var opponentCodeTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18)
        label.numberOfLines = 3
        label.textAlignment = .center
        label.textColor = .black
        
        let attributedString = NSMutableAttributedString(
            string: "상대방 연결코드"
        )
        attributedString.addAttribute(
            NSAttributedString.Key.kern,
            value: CGFloat(-1),
            range: NSRange(location: 0, length: attributedString.length)
        )
        label.attributedText = attributedString
        return label
    }()
    
    private lazy var  opponentCodeTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.attributedPlaceholder = NSAttributedString(
            string: "00000",
            attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16.0)]
        )
        textField.borderStyle = .none
        textField.keyboardType = .phonePad
        textField.backgroundColor = UIColor.clear
        return textField
    }()
    
    
    private lazy var opponentLine: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(hex: "23AA49", alpha: 1.0)
        return view
    }()
    
    private let aloneStartButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.gray, for: .normal)
        button.backgroundColor = .white
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 14),
            .kern: -1,
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
        
        let attributedTitle = NSAttributedString(
            string: "혼자 사용하기",
            attributes: attributes
        )
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.addTarget(
            self,
            action: #selector(aloneStartButtonTapped),
            for: .touchUpInside
        )
        return button
    }()

    @objc func aloneStartButtonTapped() {
        let homeViewController = CustomTabBarController()
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

    @objc private func dismissKeyboard() {
         view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConfigure()
        setupCopyButton()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
        
        opponentCodeTextField.delegate = self
    }
    
    private func setupConfigure() {
        view.backgroundColor = .white
        
        view.addSubview(logoImageView)
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(myCodeTitleLabel)
        view.addSubview(myCodeLabel)
        view.addSubview(copyButton)
        view.addSubview(line)
        
        view.addSubview(opponentCodeTitleLabel)
        view.addSubview(opponentCodeTextField)
        view.addSubview(opponentLine)
        
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
            make.left.equalToSuperview().offset(30)
            make.top.equalTo(subtitleLabel.snp.bottom).offset(90)
        }
        
        myCodeLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(30)
            make.top.equalTo(myCodeTitleLabel.snp.bottom).offset(9)
        }
        
        line.snp.makeConstraints { make in
            make.top.equalTo(myCodeLabel.snp.bottom).offset(9)
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
            make.height.equalTo(1.5)
        }
        
        copyButton.snp.makeConstraints { make in
            make.width.equalTo(20)
            make.height.equalTo(20)
            make.right.equalToSuperview().offset(-36)
            make.bottom.equalTo(line.snp.top).offset(-10)
        }
        
        opponentCodeTitleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(30)
            make.top.equalTo(line.snp.bottom).offset(70)
        }
        
        opponentCodeTextField.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(30)
            make.top.equalTo(opponentCodeTitleLabel.snp.bottom).offset(9)
        }
        
        opponentCodeTextField.font = UIFont.boldSystemFont(ofSize: 18.0)
        opponentCodeTextField.textAlignment = .center
        
        opponentLine.snp.makeConstraints { make in
            make.top.equalTo(opponentCodeTextField.snp.bottom).offset(9)
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
            make.height.equalTo(1.5)
        }
        
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

extension ConnectViewController: UITextFieldDelegate {
     func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
         if textField == opponentCodeTextField {
             guard let text = textField.text else { return true }
             let newLength = text.count + string.count - range.length
             return newLength <= 5
         }
         return true
     }
}

extension ConnectViewController {
    private func setupCopyButton() {
        copyButton.rx.tap
            .bind(onNext: {
                UIPasteboard.general.string = self.myCodeLabel.text
            }).disposed(by: disposeBag)
        
        if let storedString = UIPasteboard.general.string {
            print(storedString)
        }
    }
    
    @objc private func copyButtonTapped() {
        UIPasteboard.general.string = self.myCodeLabel.text
        self.showToast(message: "클립보드에 복사되었습니다.")
    }
    
    func showToast(message : String, font: UIFont = UIFont.systemFont(ofSize: 14.0)) {
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width / 2 - 100,
                                               y: self.view.frame.size.height - 200,
                                               width: 200,
                                               height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.font = font
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(
            withDuration: 3.5,
            delay: 0.1,
            options: .curveEaseOut,
            animations: {
             toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
}
