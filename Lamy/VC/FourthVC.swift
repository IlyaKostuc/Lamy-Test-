//
//  FourthVC.swift
//  Lamy
//
//  Created by Maxim Fedoseenko on 24.04.2024.
//

import UIKit

class FourthVC: UIViewController {
    
    
    private var color: UIColor {#colorLiteral(red: 0, green: 0.7467783505, blue: 0.3957722605, alpha: 1)}
    private var colorCircle: UIColor {#colorLiteral(red: 0, green: 0.7619201031, blue: 0.1245176956, alpha: 0.3972475166)}
    
    private lazy var imageViewIphone = makeImageViewIphone()
    private lazy var viewLayer = makeView()
    
    //
    private lazy var label = makeLabel()
    private lazy var subtitle = makeSubtitle()
    
    private lazy var buttonTrailing = makeButtonTralling()
    private lazy var buttonLeading = makeButtonLeading()
    
    //3 круга
    private lazy var circlOne = viewCircleOne()
    private lazy var circlTwo = viewCircleTwo()
    private lazy var circlThree = viewCircleThree()
    
    //StackView
    private lazy var stackView = stackViewCircls()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        navigationItem.hidesBackButton = true
    }
    
    private func setupUI() {
        
        view.backgroundColor = .systemGray6
        //navigationBar()
        
        view.addSubview(imageViewIphone)
        makeConstrainsImageViewIphone()
        
        view.addSubview(viewLayer)
        makeConstrainsView()
        
        view.addSubview(label)
        makeConstrainsLabel()
        
        view.addSubview(subtitle)
        makeConstrainsSubtitle()
        
        view.addSubview(buttonTrailing)
        makeConstrainsButtonTralling()
        
        view.addSubview(buttonLeading)
        makeConstrainsButtonLeading()
        
        view.addSubview(stackView)
        stackViewCirclsConstrains()
        
        
    }
    
    
}

//MARK: - Рассширение FirstVC
extension FourthVC {
    
    //Создание Картинки Айфона
    private func makeImageViewIphone() -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Главный3")
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }
    
    //Создание Констрейтов Картинки Айфона
    private func makeConstrainsImageViewIphone() {
        imageViewIphone.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageViewIphone.topAnchor.constraint(equalTo: view.topAnchor, constant: 330),
            imageViewIphone.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageViewIphone.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageViewIphone.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    //Create View
    private func makeView() -> UIView {
        let view = UIView()
        view.backgroundColor = .white
        
        view.layer.cornerRadius = 25
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        return view
    }
    
    //Создание констрейтов View
    private func makeConstrainsView() {
        viewLayer.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            viewLayer.topAnchor.constraint(equalTo: view.topAnchor, constant: 490),
            viewLayer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            viewLayer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            viewLayer.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    //Создание Label
    private func makeLabel() -> UILabel {
        let label = UILabel()
        label.textColor = .black
        //создали атрибутированную строку (NSMutableAttributedString) и применили к ней изменение цвета для определенной подстроки, а затем отобразили эту атрибутированную строку в UILabel
        
        //Здесь вы создаете новый экземпляр NSMutableAttributedString со строкой "Explore Our Vast Grocery Products We Offer". NSMutableAttributedString позволяет вам применять различные стили к различным частям текста.
        let attributeText = NSMutableAttributedString(string: "Легка Реєстрація, Не Потрібно Чекати 3 Хвилин")
        
        //Этот вызов метода apply(color:toSubstring:), который, вероятно, является частью расширения NSMutableAttributedString, меняет цвет текста для подстроки "Vast Grocery" на цвет, указанный в переменной color. Это означает, что только слова "Vast Grocery" будут отображаться выбранным цветом.
        attributeText.apply(color: color, toSubstring: "Легка")
        
        
        //В этой строке вы устанавливаете атрибутированный текст, который вы только что стилизовали, в свойство attributedText объекта UILabel под названием label. Это заставит UILabel отображать стилизованный текст, где "Vast Grocery" будет выделен указанным цветом.
        label.attributedText = attributeText
        
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 27)
        return label
    }
    
    //Cоздание констрейтов Label
    private func makeConstrainsLabel() {
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: viewLayer.topAnchor, constant: 32),
            label.leadingAnchor.constraint(equalTo: viewLayer.leadingAnchor, constant: 25),
            label.trailingAnchor.constraint(equalTo: viewLayer.trailingAnchor, constant: -25),
        ])
    }
    
    
    private func makeSubtitle() -> UILabel {
        let label = UILabel()
        label.text = "Реєстрація не змусить вас чекати більше 3 хвилин, після створення облікового запису Користувач стане нашим клієнтом, з невеликими бонусами за першу покупку"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }
    
    private func makeConstrainsSubtitle() {
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            subtitle.topAnchor.constraint(equalTo: label.topAnchor, constant: 85),
            subtitle.leadingAnchor.constraint(equalTo: viewLayer.leadingAnchor, constant: 16),
            subtitle.trailingAnchor.constraint(equalTo: viewLayer.trailingAnchor, constant: -16),
        ])
    }
    
    //Создание кнопки Cправа
    private func makeButtonTralling() -> UIButton {
        let button = UIButton()
        let image = UIImage(systemName: "chevron.right.circle.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 50, weight: .medium))
        button.setImage(image, for: .normal)
        button.tintColor = color
        
        button.addTarget(self, action: #selector(tapButtonTralling), for: .touchUpInside)
        
        return button
    }
    
    private func makeConstrainsButtonTralling() {
        buttonTrailing.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonTrailing.bottomAnchor.constraint(equalTo: viewLayer.bottomAnchor, constant: -55),
            buttonTrailing.trailingAnchor.constraint(equalTo: viewLayer.trailingAnchor, constant: -16),
            buttonTrailing.widthAnchor.constraint(equalToConstant: 80),
            buttonTrailing.heightAnchor.constraint(equalToConstant: 80),
        ])
    }
    
    //Создание кнопки Cлева
    private func makeButtonLeading() -> UIButton {
        let button = UIButton()
        let image = UIImage(systemName: "chevron.backward.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 50, weight: .light))
        button.setImage(image, for: .normal)
        button.tintColor = color
        
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        
        
        return button
    }
    
    private func makeConstrainsButtonLeading() {
        buttonLeading.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonLeading.bottomAnchor.constraint(equalTo: viewLayer.bottomAnchor, constant: -55),
            buttonLeading.leadingAnchor.constraint(equalTo: viewLayer.leadingAnchor, constant: 16),
            buttonLeading.widthAnchor.constraint(equalToConstant: 80),
            buttonLeading.heightAnchor.constraint(equalToConstant: 80),
        ])
    }
    
    @objc func tapButton() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func tapButtonTralling() {
        let mainVC = MainVC()
        navigationController?.pushViewController(mainVC, animated: true)
    }
    
    
    
    
    
    //MARK: - Создание 3 круга
    private func viewCircleOne() -> UIView {
        let circle = UIView()
        circle.backgroundColor = colorCircle
        circle.layer.cornerRadius = 5
        
        
        circle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            circle.widthAnchor.constraint(equalToConstant: 10),
            circle.heightAnchor.constraint(equalToConstant: 10),
        ])
        
        return circle
    }
    
    private func viewCircleTwo() -> UIView {
        let circle = UIView()
        circle.backgroundColor = colorCircle
        circle.layer.cornerRadius = 5
        
        circle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            circle.widthAnchor.constraint(equalToConstant: 10),
            circle.heightAnchor.constraint(equalToConstant: 10),
        ])
        
        return circle
    }
    
    private func viewCircleThree() -> UIView {
        let circle = UIView()
        circle.backgroundColor = color
        circle.layer.cornerRadius = 7.5
        
        circle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            circle.widthAnchor.constraint(equalToConstant: 15),
            circle.heightAnchor.constraint(equalToConstant: 15),
        ])
        
        return circle
    }
    
    //MARK: - Создание StackView
    private func stackViewCircls() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = NSLayoutConstraint.Axis.horizontal
        stackView.distribution = UIStackView.Distribution.equalSpacing
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing = 10
        
        stackView.addArrangedSubview(circlOne)
        stackView.addArrangedSubview(circlTwo)
        stackView.addArrangedSubview(circlThree)
        
        return stackView
    }
    
    private func stackViewCirclsConstrains() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: viewLayer.centerXAnchor),
            stackView.bottomAnchor.constraint(equalTo: viewLayer.bottomAnchor, constant: -85),
        ])
    }
    
    
}

#Preview {
    FourthVC()
}


