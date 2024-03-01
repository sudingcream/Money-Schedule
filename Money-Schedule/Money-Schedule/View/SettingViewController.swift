//
//  SettingViewController.swift
//  Money-Schedule
//
//  Created by betty on 2024/02/27.
//

import UIKit
import SnapKit

class SettingViewController: UIViewController {
    
    private lazy var viewtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 19)
        label.text = "설정"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    private lazy var pushContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    private lazy var pushImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(systemName: "bell.circle.fill")
        imageView.image = image
        return imageView
    }()
    
    private lazy var pushtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15)
        label.text = "푸쉬 알림"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .black
        return label
    }()
    
    private lazy var pushSwitch: UISwitch = {
        let switchButton = UISwitch()
        switchButton.translatesAutoresizingMaskIntoConstraints = false
        return switchButton
    }()
    
    
    private lazy var darkmodeContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    private lazy var darkmodeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(systemName: "moon.circle.fill")
        imageView.image = image
        return imageView
    }()
    
    private lazy var darkmodetitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15)
        label.text = "모드 설정"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .black
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    private func setupLayout() {
        
        view.backgroundColor = .white
        view.addSubview(viewtitleLabel)
        view.addSubview(pushContainerView)
        pushContainerView.addSubview(pushImageView)
        pushContainerView.addSubview(pushtitleLabel)
        pushContainerView.addSubview(pushSwitch)
        
        view.addSubview(darkmodeContainerView)
        darkmodeContainerView.addSubview(darkmodeImageView)
        darkmodeContainerView.addSubview(darkmodetitleLabel)
        
        viewtitleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(70)
        }
        
        pushContainerView.snp.makeConstraints { make in
            make.top.equalTo(viewtitleLabel.snp.bottom).offset(30)
            make.height.equalTo(40)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalToSuperview().offset(120)
        }
        
        pushImageView.snp.makeConstraints { make in
            make.top.equalTo(pushContainerView.snp.top)
            make.bottom.equalTo(pushContainerView.snp.bottom)
            make.left.equalTo(pushContainerView.snp.left).offset(30)
            make.width.equalTo(40)
            make.height.equalTo(40)
        }
        
        pushImageView.tintColor = .orange
        pushtitleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(pushImageView.snp.right).offset(12)
        }
        
        pushSwitch.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalTo(pushContainerView.snp.right).offset(-30)
        }
        
        darkmodeContainerView.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalTo(pushContainerView.snp.bottom).offset(24)
        }
        
        darkmodeImageView.snp.makeConstraints { make in
            make.top.equalTo(darkmodeContainerView.snp.top)
            make.bottom.equalTo(darkmodeContainerView.snp.bottom)
            make.left.equalTo(darkmodeContainerView.snp.left).offset(30)
            make.width.equalTo(40)
            make.height.equalTo(40)
        }
        darkmodeImageView.tintColor = UIColor(hex: "AF96FB")
        
        darkmodetitleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(pushImageView.snp.right).offset(12)
        }
    }
}
