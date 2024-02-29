//
//  CustomTabBarController.swift
//  Money-Schedule
//
//  Created by betty on 2024/02/29.
//

import UIKit
import SnapKit
import Then
import RxSwift
import RxCocoa

final class CustomTabBarController: UIViewController {
    fileprivate let tabBar = CustomTabBar()
    private var childViewControllersGroup = [UIViewController]()
    private let disposeBag = DisposeBag()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setUp()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    private func setUp() {
        setUpTabBar()
        setUpTabBarControllers()
        setUpBind()
    }
    
    private func setUpTabBar() {
        view.addSubview(tabBar)
        tabBar.snp.makeConstraints {
            $0.leading.bottom.trailing.equalToSuperview()
            $0.top.equalTo(view.snp.bottom).offset(-100)
        }
    }
    
    private func setUpTabBarControllers() {
        tabBar.items.forEach { item in
            let viewController = item.tabView
            addChild(viewController)
            view.addSubview(viewController.view)
            viewController.didMove(toParent: self)
            
            viewController.view.snp.makeConstraints {
                $0.top.leading.trailing.equalToSuperview()
                $0.bottom.equalTo(tabBar.snp.top)
            }
            
            childViewControllersGroup.append(viewController)
        }
        
        guard let shouldFrontView = childViewControllersGroup[0].view else { return }
        view.bringSubviewToFront(shouldFrontView)
    }

    
    
    private func setUpBind() {
        tabBar.rx.tapButton
            .bind(with: self) { ss, index in
                guard let shouldFrontView = ss.childViewControllersGroup[index].view else { return }
                ss.view.bringSubviewToFront(shouldFrontView)
            }
            .disposed(by: disposeBag)
    }
    
    // MARK: 각 View의 Title
    private func addTitleLabel(in vc: UIViewController, text: String?) {
        let label = UILabel().then {
            $0.font = .systemFont(ofSize: 18)
            $0.textColor = .black
            $0.text = text
        }
        vc.view.addSubview(label)
        
        label.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(45)
        }
    }
}

extension Reactive where Base: CustomTabBarController {
    var changeIndex: Binder<Int> {
        Binder(base) { base, index in
            base.tabBar.rx.changeIndex.onNext(index)
        }
    }
}
