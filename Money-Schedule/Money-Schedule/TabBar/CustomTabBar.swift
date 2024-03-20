//
//  CustomTabBar.swift
//  Money-Schedule
//
//  Created by betty on 2024/02/29.
//

import UIKit
import SnapKit
import Then
import RxSwift
import RxCocoa
final class CustomTabBar: UIView {
    private let stackView = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.alignment = .center
    }
    private var buttons = [UIButton]()
    private let disposeBag = DisposeBag()
    fileprivate var tapSubject = PublishSubject<Int>()
    
    let items = TabItem.allCases
    fileprivate var selectedIndex = 0 {
        didSet {
            buttons.enumerated().forEach { i, btn in
                btn.isSelected = i == selectedIndex
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    private func setUp() {
        items
            .enumerated()
            .forEach { i, item in
                let button = UIButton().then {
                    $0.setImage(item.normalImage, for: .normal)
                    $0.setImage(item.selectedImage, for: .selected)
                    $0.setTitle(item.tabTitle, for: .normal)
                    $0.setTitleColor(.black, for: .normal)
                    $0.titleLabel?.font = UIFont.systemFont(ofSize: 12)
                    
                    let imageSize = $0.imageView?.frame.size ?? .zero
                    let titleSize = $0.titleLabel?.frame.size ?? .zero
                    let totalWidth = imageSize.width + titleSize.width
                
                    $0.titleEdgeInsets = UIEdgeInsets(
                        top: 0,
                        left:  -40,
                        bottom: -(imageSize.height + 20),
                        right: 0
                    )
                    $0.imageEdgeInsets = UIEdgeInsets(
                        top: -(titleSize.height + 10),
                        left: 0,
                        bottom: 0,
                        right: 0
                    )
                    $0.contentHorizontalAlignment = .center
                    $0.contentVerticalAlignment = .center
                }
                button.isSelected = i == 0
                button.rx.tap
                    .map { _ in i }
                    .bind(to: tapSubject)
                    .disposed(by: disposeBag)
                
                buttons.append(button)
            }
        
        tapSubject.bind(to: rx.selectedIndex).disposed(by: disposeBag)
        
        backgroundColor = .white
        
        addSubview(stackView)
        buttons.forEach(stackView.addArrangedSubview(_:))
        
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

}

extension Reactive where Base: CustomTabBar {
    var tapButton: Observable<Int> {
        base.tapSubject
    }
    
    var changeIndex: Binder<Int> {
        Binder(base) { base, index in
            base.selectedIndex = index
        }
    }
}
