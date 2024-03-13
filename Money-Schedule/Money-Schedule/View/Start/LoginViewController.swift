//
//  LoginViewController.swift
//  Money-Schedule
//
//  Created by betty on 2024/02/28.
//

import UIKit

import GoogleSignIn
import AuthenticationServices

class LoginViewController: UIViewController {

    var didSendEventClosure: ((LoginViewController.Event) -> Void)?
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .black
        
        let attributedString = NSMutableAttributedString(
            string: "가계부와 스케쥴을\n공유해보세요"
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
            string: "사랑하는 사람과\n일정 관리를 더욱 편리하게\n간편하고 신속하게 공유해볼까요?"
        )
        attributedString.addAttribute(
            NSAttributedString.Key.kern,
            value: CGFloat(-1),
            range: NSRange(location: 0, length: attributedString.length)
        )
        label.attributedText = attributedString
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
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 23
        return stackView
    }()
    
    private let googleLoginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "google"), for: .normal)
        button.addTarget(
            self,
            action: #selector(googleLoginButtonTapped),
            for: .touchUpInside
        )
        return button
    }()
    
    private let appleLoginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "Apple"), for: .normal)
        button.addTarget(
            self,
            action: #selector(appleLoginButtonTapped),
            for: .touchUpInside
        )
        return button
    }()
    
    private let kakaoLoginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "kakao"), for: .normal)
        button.addTarget(
            self,
            action: #selector(kakaoLoginButtonTapped),
            for: .touchUpInside
        )
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        view.addSubview(backgroundImageView)
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(logoImageView)
        view.addSubview(stackView)

        stackView.addArrangedSubview(googleLoginButton)
        stackView.addArrangedSubview(appleLoginButton)
        stackView.addArrangedSubview(kakaoLoginButton)

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
        
        stackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(42)
            make.top.equalTo(subtitleLabel.snp.bottom).offset(40)
        }
    }
    
    deinit {
        print("LoginViewController deinit")
    }

    @objc private func didTapLoginButton(_ sender: Any) {
        didSendEventClosure?(.login)
    }
}

extension LoginViewController {
    enum Event {
        case login
    }
}

extension LoginViewController {
    @objc func appleLoginButtonTapped() {
        
    }
}
extension LoginViewController {
    @objc func kakaoLoginButtonTapped() {
        
    }
}

// MARK: - Google Login
extension LoginViewController {
    // 기존 로그인 상태 확인
    func checkLoginState() {
        GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
            if error != nil || user == nil {
                print("로그인 한 상태가 아닙니다.")
            } else {
                guard let user = user else { return }
                guard let profile = user.profile else { return }
                self.googleLoginUserData(profile)
            }
        }
    }
    
    // Google Login
    @objc func googleLoginButtonTapped() {
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { signInResult, error in
            guard error == nil else {
                let popup = UIAlertController(
                    title: "로그인 실패",
                    message: "다시 로그인해주세요.",
                    preferredStyle: .alert
                )
                let action = UIAlertAction(
                    title: "확인",
                    style: .default
                )
                popup.addAction(action)
                self.present(popup, animated: true)
                return
            }
            
            guard let user = signInResult?.user else { return }
            guard let profile = user.profile else { return }
            self.googleLoginUserData(profile)
        }
    }
    
    // 구글 유저 데이터 전달
    func googleLoginUserData(_ profile: GIDProfileData) {
        let customTabBarController = CustomTabBarController()
        customTabBarController.modalPresentationStyle = .fullScreen
        self.present(
            customTabBarController,
            animated: true,
            completion: nil
        )
        let emailAddress = profile.email
        let userName = profile.name
    }
}
