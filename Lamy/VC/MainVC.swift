//
//  MainVC.swift
//  Lamy
//
//  Created by Maxim Fedoseenko on 20.04.2024.
//

import UIKit

class MainVC: UIViewController {
    
    private var colorDeafault: UIColor {#colorLiteral(red: 0.1801796556, green: 0.1949045658, blue: 0.2162286341, alpha: 1)}
    private var color: UIColor {#colorLiteral(red: 0, green: 0.7467783505, blue: 0.3957722605, alpha: 1)}
    
    private lazy var imageLamy = makeImageLamy()
    
    private lazy var imagePenSecond = makePenSecondLamy()
    private lazy var newButton = makeNewButton()
    private lazy var titleText = makeTitle()
    private lazy var subtitleText = makeSubtitle()
    private lazy var buttonNavigation = makeButtonNavigation()
    
    private lazy var stackView = makeStackViewTextEndButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = colorDeafault
        navigationItem.hidesBackButton = true
        
        setupUI()
    }
    
    func setupUI() {
        
        view.addSubview(imageLamy)
        makeConstrainsLamy()
        
        view.addSubview(imagePenSecond)
        makePenSecondLamyConstrains()
        
        view.addSubview(stackView)
        makeStackViewConstrains()
        
        view.addSubview(buttonNavigation)
        makeButtonNavigationConstrains()
    }
}

extension MainVC {
    private func makeImageLamy() -> UIImageView {
        let image = UIImageView()
        image.image = UIImage(named: "Logo(White)")
        image.contentMode = .scaleAspectFill
        
        return image
    }
    
    private func makeConstrainsLamy() {
        imageLamy.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageLamy.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            imageLamy.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 75),
            imageLamy.widthAnchor.constraint(equalToConstant: 45),
            imageLamy.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    //Create Pens
    private func makePenSecondLamy() -> UIImageView {
        let image = UIImageView()
        image.image = UIImage(named: "35")
        image.contentMode = .scaleAspectFill
        
        return image
    }
    
    private func makePenSecondLamyConstrains() {
        imagePenSecond.translatesAutoresizingMaskIntoConstraints = false
        //imagePenSecond.transform = imagePenSecond.transform.rotated(by: .pi / 300.5)
        NSLayoutConstraint.activate([
            imagePenSecond.heightAnchor.constraint(equalToConstant: 25),
            
            imagePenSecond.topAnchor.constraint(equalTo: view.topAnchor, constant: 400),
            imagePenSecond.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imagePenSecond.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            
        ])
    }
    //    private func stackViewCircls() -> UIStackView {
    //        let stackView = UIStackView()
    //        stackView.axis = NSLayoutConstraint.Axis.vertical
    //        stackView.distribution = UIStackView.Distribution.equalSpacing
    //        stackView.alignment = UIStackView.Alignment.center
    //        stackView.spacing = 25
    //
    //        stackView.addArrangedSubview(buttonNavigation)
    //        stackView.addArrangedSubview(labelSignIn)
    //
    //
    //        return stackView
    //    }
    //
    //    private func stackViewCirclsConstrains() {
    //        stackView.translatesAutoresizingMaskIntoConstraints = false
    //        NSLayoutConstraint.activate([
    //            stackView.centerXAnchor.constraint(equalTo: viewLayer.centerXAnchor),
    //            stackView.trailingAnchor.constraint(equalTo: viewLayer.trailingAnchor, constant: -16),
    //            stackView.leadingAnchor.constraint(equalTo: viewLayer.leadingAnchor, constant: 16),
    //            stackView.bottomAnchor.constraint(equalTo: viewLayer.bottomAnchor, constant: -70),
    //
    //        ])
    //    }
    
    
    //Create Button
    private func makeNewButton() -> UIButton {
        let button = UIButton()
        button.backgroundColor = color
        button.setTitle("Нове!", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.layer.cornerRadius = 15
        
        return button
    }
    
    //Create Title
    private func makeTitle() -> UILabel {
        let title = UILabel()
        title.text = """
                     LAMY це все
                     що вам потрiбно
                     """
        
        title.font = UIFont.boldSystemFont(ofSize: 31)
        title.textAlignment = .right
        title.textColor = .white
        title.numberOfLines = 0
        
        return title
        
    }
    
    //Create Subtitle
    private func makeSubtitle() -> UILabel {
        let title = UILabel()
        title.text = """
                     письмо, оцифрування,
                     необмежені можливості
                     """
        title.textAlignment = .right
        title.textColor = .gray
        title.numberOfLines = 0
        
        return title
        
    }
    
    // ButtonNavigation
    private func makeButtonNavigation() -> UIButton {
        let button = UIButton()
        button.backgroundColor = .clear
        button.tintColor = .red
        button.setTitle("Категорія продукту ->", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 15
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        
        //Другими словами, если вы добавляете обработчик для .touchUpInside, вы говорите приложению: "Выполни этот код, когда кто-то нажмет на кнопку и отпустит её, не уводя палец за пределы кнопки". Это делает взаимодействие с пользователем интуитивно понятным, так как большинство кнопочных действий в пользовательских интерфейсах работают именно так.
        button.addTarget(self, action: #selector(tapButtonNavigation), for: .touchUpInside)
        
        return button
    }
    
    //Create StackView
    private func makeStackViewTextEndButton() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        //stackView.distribution = .equalSpacing
        stackView.spacing = 10
        stackView.alignment = .trailing
        
        stackView.addArrangedSubview(newButton)
        stackView.addArrangedSubview(titleText)
        stackView.addArrangedSubview(subtitleText)
        
        
        return stackView
    }
    
    //Create StackViewConstrains
    private func makeStackViewConstrains() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 450),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            
            newButton.widthAnchor.constraint(equalToConstant: 65)
        ])
    }
    
    //Create ButtonNavigationConstrains {
    private func makeButtonNavigationConstrains() {
        buttonNavigation.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonNavigation.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 100),
            buttonNavigation.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            buttonNavigation.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -45),
            buttonNavigation.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 160)
        ])
    }
    
    @objc func tapButtonNavigation() {
        let registrationVC = RegistrationVC()
        navigationController?.pushViewController(registrationVC, animated: true)
    }
}





#Preview {
    MainVC()
}
