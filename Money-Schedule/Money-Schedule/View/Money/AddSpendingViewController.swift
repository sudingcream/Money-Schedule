//
//  AddSpendingViewController.swift
//  Money-Schedule
//
//  Created by betty on 2024/03/21.
//

import UIKit

class AddSpendingViewController: UIViewController {
    
    private lazy var dismissButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(dismissButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func dismissButtonTapped() {
        self.dismiss(animated: false)
    }
    
    private lazy var viewtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "가계부 등록하기"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    private lazy var calendarTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18)
        label.numberOfLines = 3
        label.textAlignment = .center
        label.textColor = .black
        
        let attributedString = NSMutableAttributedString(
            string: "날짜"
        )
        attributedString.addAttribute(
            NSAttributedString.Key.kern,
            value: CGFloat(-1),
            range: NSRange(location: 0, length: attributedString.length)
        )
        label.attributedText = attributedString
        return label
    }()
   
    private lazy var calendarLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "NotoSansKR-Thin", size: 18)
        label.numberOfLines = 0
        label.textAlignment = .right
        label.textColor = UIColor.gray
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.dateFormat = "yyyy년 M월 d일 EEEE"
        let dateString = dateFormatter.string(from: Date())
        
        let attributedString = NSMutableAttributedString(string: dateString)
        attributedString.addAttribute(
            .kern,
            value: CGFloat(-1),
            range: NSRange(location: 0, length: attributedString.length)
        )
        
        label.attributedText = attributedString
        return label
    }()
    
    @objc private func datePickerValueChanged(_ sender: UIDatePicker) {
        calendarLabel.text = dateFormat(date: sender.date)
    }
    
    private lazy var calendarSelectedButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(calendarSelectedButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func calendarSelectedButtonTapped() {
        showDatePickerPopup()
    }
    
    private func showDatePicker() {
        view.addSubview(datePicker)
        
        datePicker.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(priceLine.snp.bottom).offset(50)
        }
    }
    private func hideDatePicker() {
        datePicker.isHidden = true
        datePicker.removeFromSuperview()
    }
    private lazy var datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.preferredDatePickerStyle = .wheels
        picker.locale = Locale(identifier: "ko-KR")
        picker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
        return picker
    }()
    private lazy var calendarLine: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(hex: "23AA49", alpha: 1.0)
        return view
    }()
    
    private lazy var priceTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18)
        label.numberOfLines = 3
        label.textAlignment = .center
        label.textColor = .black
        
        let attributedString = NSMutableAttributedString(
            string: "금액"
        )
        attributedString.addAttribute(
            NSAttributedString.Key.kern,
            value: CGFloat(-1),
            range: NSRange(location: 0, length: attributedString.length)
        )
        label.attributedText = attributedString
        return label
    }()
    private lazy var priceTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.attributedPlaceholder = NSAttributedString(
            string: "0",
            attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16.0)]
        )
        textField.borderStyle = .none
        textField.keyboardType = .numberPad
        textField.backgroundColor = UIColor.clear
        return textField
    }()
    private lazy var wontitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "NotoSansKR-Thin", size: 18)
        label.text = "원"
        label.numberOfLines = 0
        label.textAlignment = .right
        label.textColor = .gray
        return label
    }()
    private lazy var priceLine: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(hex: "23AA49", alpha: 1.0)
        return view
    }()
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 18
        return stackView
    }()
    private let incomeButton: UIButton = {
        let button = UIButton()
        button.setTitle("입금", for: .normal)
        button.backgroundColor = UIColor(hex: "23AA49")
        button.titleLabel?.textColor = .white
        button.layer.cornerRadius = 10
        return button
    }()
    private let spendingButton: UIButton = {
        let button = UIButton()
        button.setTitle("지출", for: .normal)
        button.backgroundColor = UIColor(hex: "FA718A")
        button.titleLabel?.textColor = .white
        button.layer.cornerRadius = 10
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConfigure()
        setupTapGesture()
    }
    
    private func setupConfigure() {
        view.backgroundColor = .white
        view.addSubview(dismissButton)
        view.addSubview(viewtitleLabel)
        
        view.addSubview(calendarTitleLabel)
        view.addSubview(calendarLabel)
        view.addSubview(calendarSelectedButton)
        view.addSubview(calendarLine)
        
        view.addSubview(priceTitleLabel)
        view.addSubview(priceTextField)
        view.addSubview(wontitleLabel)
        view.addSubview(priceLine)

        
        view.addSubview(stackView)
        stackView.addArrangedSubview(incomeButton)
        stackView.addArrangedSubview(spendingButton)
        
        dismissButton.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(80)
            make.right.equalTo(view.snp.right).offset(-20)
            make.width.equalTo(25)
            make.height.equalTo(25)
        }
        
        viewtitleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(80)
        }
        calendarTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(viewtitleLabel.snp.top).offset(70)
            make.left.equalToSuperview().offset(30)
        }
        calendarLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-35)
            make.top.equalTo(calendarTitleLabel.snp.bottom).offset(9)
        }
        calendarSelectedButton.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-35)
            make.left.equalToSuperview().offset(35)
            make.top.equalTo(calendarTitleLabel.snp.bottom).offset(9)
            make.bottom.equalTo(calendarLine.snp.top)
        }
        calendarLine.snp.makeConstraints { make in
            make.top.equalTo(calendarTitleLabel.snp.bottom).offset(49)
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
            make.height.equalTo(1.5)
        }
        priceTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(calendarLine.snp.top).offset(43)
            make.left.equalToSuperview().offset(30)
        }
        priceTextField.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-60)
            make.top.equalTo(priceTitleLabel.snp.bottom).offset(9)
        }
        priceTextField.font = UIFont.boldSystemFont(ofSize: 16.0)
        priceTextField.textAlignment = .right
        
        wontitleLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-35)
            make.top.equalTo(priceTitleLabel.snp.bottom).offset(9)
        }
        priceLine.snp.makeConstraints { make in
            make.top.equalTo(priceTextField.snp.bottom).offset(9)
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
            make.height.equalTo(1.5)
        }
        stackView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
            make.height.equalTo(53)
            make.bottom.equalToSuperview().offset(-50)
        }
    }
}

extension AddSpendingViewController {
    private func setupDatePicker() {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.locale = Locale(identifier: "ko-KR")
        datePicker.addTarget(self, action: #selector(dateChange), for: .valueChanged)
        calendarLabel.text = dateFormat(date: Date())
    }
    
    @objc func dateChange(_ sender: UIDatePicker) {
        calendarLabel.text = dateFormat(date: sender.date)
    }

    private func dateFormat(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 MM월 dd일"
        
        return formatter.string(from: date)
    }

}

extension AddSpendingViewController {
    private func setupTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }

    private func showDatePickerPopup() {
        let dateChooserAlert = UIAlertController(
            title: "날짜 선택",
            message: nil,
            preferredStyle: .actionSheet
        )
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.locale = Locale(identifier: "ko_KO")
        dateChooserAlert.view.addSubview(datePicker)
        dateChooserAlert.view.heightAnchor.constraint(equalToConstant: 350).isActive = true
        
        datePicker.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(dateChooserAlert.view.snp.top)
            make.bottom.equalTo(dateChooserAlert.view.snp.bottom).offset(-30)
        }
        
        dateChooserAlert.addAction(UIAlertAction(title: "선택 완료", style: .default, handler: { (action) in
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy년 MM월 dd일"
            let selectedDate = datePicker.date
            
            let currentDate = Date()
            let calendar = Calendar.current
            let isToday = calendar.isDate(selectedDate, inSameDayAs: currentDate)
            
            var formattedDate = formatter.string(from: selectedDate)
            if isToday {
                formattedDate += " (오늘)"
            }
            
            self.calendarLabel.text = formattedDate
        }))
        self.present(dateChooserAlert, animated: true, completion: nil)
    }

}
