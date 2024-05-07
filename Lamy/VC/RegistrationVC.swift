//
//  RegistrationVC.swift
//  Lamy
//
//  Created by Maxim Fedoseenko on 20.04.2024.
//

import UIKit
import SafariServices

class RegistrationVC: UIViewController, SFSafariViewControllerDelegate {

    private lazy var imageLamy = logoLamy()
    
    private lazy var email = emailLabel()
    private lazy var password = passwordLabel()
    private lazy var texFiledEmail = textFieldEmail()
    private lazy var texFiledPassword = textFieldPassword()
    private lazy var buttonContinue = buttonContinueNvigation()
    
    private lazy var stackViewFirst = stackViewEmaiAndPassword()
    private lazy var stackViewSecond = stackViewButton()
    
    private lazy var labelLine = labelOr()
    private lazy var buttonGoogle = buttonGoogleNavigation()
    private lazy var buttonApple = buttonAppleNavigation()
    
    private lazy var stackViewThird = stackViewGoogleAndApple()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
       
    }
    
    private func setupUI() {
        view.addSubview(imageLamy)
        makeLogoLamyConstrains()
        
        view.addSubview(stackViewFirst)
        stackViewEmaiAndPasswordConstrains()
        
        view.addSubview(stackViewSecond)
        stackViewButtonConstrains()
        
        view.addSubview(stackViewThird)
        stackViewGoogleAndAppleConstrains()
        
    }
}

extension RegistrationVC {
    //Create Logo
    private func logoLamy() -> UIImageView {
        let image = UIImageView()
        image.image = UIImage(named: "Logo2")
        
        return image
    }
    
    //Create Logo Constrains
    private func makeLogoLamyConstrains() {
        imageLamy.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageLamy.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            imageLamy.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -120),
            imageLamy.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 120),
            
            imageLamy.heightAnchor.constraint(equalToConstant: 35),
        ])
    }
    
    //Create Email Label
    private func emailLabel() -> UILabel {
        let emailLabel = UILabel()
        emailLabel.text = "Електронна пошта"
        emailLabel.textColor = .black
        emailLabel.font = UIFont.boldSystemFont(ofSize: 17)
        
        return emailLabel
    }

    //Create Password Label
    private func passwordLabel() -> UILabel {
        let passwordLabel = UILabel()
        passwordLabel.text = "Пароль"
        passwordLabel.textColor = .black
        passwordLabel.font = UIFont.boldSystemFont(ofSize: 17)
        
        return passwordLabel
    }
    
    //Create TextField Email
    private func textFieldEmail() -> UITextField {
        let textFiledEmail = UITextField()
        textFiledEmail.placeholder = "Будь ласка, введіть свою ел. адресу"
        textFiledEmail.borderStyle = .none
        
        textFiledEmail.font = UIFont.systemFont(ofSize: 14)
        textFiledEmail.layer.cornerRadius = 15
        textFiledEmail.backgroundColor = #colorLiteral(red: 0.959008038, green: 0.9689555764, blue: 0.9644734263, alpha: 1)
        
        //НЕ Понятно
        let padding = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: textFiledEmail.frame.height))
        textFiledEmail.leftView = padding
        textFiledEmail.leftViewMode = .always
        
        return textFiledEmail
    }
    
    //Create TextField Password
    private func textFieldPassword() -> UITextField {
        let textFiledPassword = UITextField()
        textFiledPassword.placeholder = "Будь ласка, введіть свій пароль"
        textFiledPassword.borderStyle = .none
        
        textFiledPassword.font = UIFont.systemFont(ofSize: 14)
        textFiledPassword.layer.cornerRadius = 15
        textFiledPassword.backgroundColor = #colorLiteral(red: 0.959008038, green: 0.9689555764, blue: 0.9644734263, alpha: 1)
        
        
        let padding = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: textFiledPassword.frame.height))
        textFiledPassword.leftView = padding
        textFiledPassword.leftViewMode = .always
        
        return textFiledPassword
    }
    
    //Create Button Continue
    private func buttonContinueNvigation() -> UIButton{
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.7486178279, green: 0.7935991883, blue: 0.8698723912, alpha: 1)
        button.tintColor = .red
        button.setTitle("Продовжувати", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.layer.cornerRadius = 15
        
        button.addTarget(self, action: #selector(tapButtonNavigation), for: .touchUpInside)
    
        return button
    }
    
    
    private func labelOr() -> UILabel{
        let label = UILabel()
        label.text = "  ⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯ Or ⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .systemGray
        
        return label
    }
    
    private func buttonGoogleNavigation() -> UIButton{
        let button = UIButton()
        
        button.layer.borderWidth = 2 //толщина рамки
        button.layer.borderColor = UIColor.systemGray3.cgColor
        
        button.setTitle("Зареєструйтеся в Google", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.layer.cornerRadius = 15
        
        button.addTarget(self, action: #selector(tapButtonGoogle), for: .touchUpInside)
    
        return button
    }
    
    private func buttonAppleNavigation() -> UIButton{
        let button = UIButton()
        
        button.layer.borderWidth = 2 //толщина рамки
        button.layer.borderColor = UIColor.systemGray3.cgColor
       
        
        button.setTitle(" Зареєструйтеся в Apple", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.layer.cornerRadius = 15
        
        button.addTarget(self, action: #selector(tapButtonApple), for: .touchUpInside)
    
        return button
    }
    
    @objc func tapButtonNavigation() {
        let buyPensVC = BuyPensVC()
        navigationController?.pushViewController(buyPensVC, animated: true)
    }
    
    @objc func tapButtonGoogle() {
        if let url = URL(string: "https://accounts.google.com/v3/signin/identifier?authuser=0&continue=https%3A%2F%2Fmyaccount.google.com%2F%3Futm_source%3Daccount-marketing-page%26utm_medium%3Dgo-to-account-button%26pli%3D1&ec=GAlAwAE&hl=ru&service=accountsettings&flowName=GlifWebSignIn&flowEntry=AddSession&dsh=S319070433%3A1715063177292877&theme=mn&ddm=0") {
            let safariVC = SFSafariViewController(url: url)
            safariVC.delegate = self
            
            present(safariVC, animated: true)
        }
    }
    @objc func tapButtonApple() {
        if let url = URL(string: "https://www.apple.com") {
            let safariVC = SFSafariViewController(url: url)
            safariVC.delegate = self
            
            present(safariVC, animated: true)
        }
    }
    
    
    
    
    
    
    //Create SatckViewFirst
    private func stackViewEmaiAndPassword() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 15
        
        
        stackView.addArrangedSubview(email)
        stackView.addArrangedSubview(texFiledEmail)
        stackView.addArrangedSubview(password)
        stackView.addArrangedSubview(texFiledPassword)
        
        return stackView
    }
    
    private func stackViewButton() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 35
        
        stackView.addArrangedSubview(stackViewFirst)
        stackView.addArrangedSubview(buttonContinue)
        
        return stackView
        
    }
    
    private func stackViewGoogleAndApple() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 20
        
        stackView.addArrangedSubview(labelLine)
        stackView.addArrangedSubview(buttonGoogle)
        stackView.addArrangedSubview(buttonApple)
        
        return stackView
        
    }
    
    private func stackViewEmaiAndPasswordConstrains() {
        stackViewFirst.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackViewFirst.topAnchor.constraint(equalTo: imageLamy.bottomAnchor, constant: 100),
            stackViewFirst.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            stackViewFirst.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            
            texFiledEmail.heightAnchor.constraint(equalToConstant: 45),
            texFiledPassword.heightAnchor.constraint(equalToConstant: 45),
          
        ])
    }
    
    private func stackViewButtonConstrains() {
        stackViewSecond.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackViewSecond.topAnchor.constraint(equalTo: imageLamy.bottomAnchor, constant: 100),
            stackViewSecond.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            stackViewSecond.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            buttonContinue.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func stackViewGoogleAndAppleConstrains() {
        stackViewThird.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackViewThird.topAnchor.constraint(equalTo: stackViewSecond.bottomAnchor, constant: 70),
            stackViewThird.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            //stackViewThird.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -35),
            stackViewThird.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            
            buttonGoogle.heightAnchor.constraint(equalToConstant: 45),
            buttonApple.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
 
    
    
    
}

#Preview {
    RegistrationVC()
}
