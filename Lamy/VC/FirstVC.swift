//
//  FirstVC.swift
//  Lamy
//
//  Created by Maxim Fedoseenko on 20.04.2024.
//

import UIKit

class FirstVC: UIViewController {
    
    //MARK: - Private properties
    private var color: UIColor {#colorLiteral(red: 0, green: 0.7467783505, blue: 0.3957722605, alpha: 1)}
    
    private lazy var imageViewIphone = makeImageViewIphone()
    private lazy var viewLayer = makeView()
    
    private lazy var label = makeLabel()
    private lazy var subtitle = makeSubtitle()
    
    
    private lazy var buttonNavigation = makeButtonNavigation()
    
    private lazy var labelSignIn = makeLabelSignIn()
    private lazy var signInButton = makeSignInButton()
    
    
    //StackView
    private lazy var stackView = stackViewCircls()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let textItem = UIBarButtonItem(title: "Пропустити", style: .plain, target: self, action: #selector(tapTextNavigation))
        textItem.tintColor = #colorLiteral(red: 0, green: 0.7467783505, blue: 0.3957722605, alpha: 1)
        
        navigationItem.rightBarButtonItem = textItem
        
        
        setupUI()
    }
    
    @objc func tapTextNavigation() {
        let mainVC = MainVC()
        navigationController?.pushViewController(mainVC, animated: true)
    }
    
    // MARK: - Private methods
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
        
        view.addSubview(stackView)
        stackViewCirclsConstrains()
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // Правильное обновление маски после установки констрейнтов
        roundUpCorners(view: viewLayer, corners: [.topLeft, .topRight], radius: 30)
    }
    
    //Проще говоря, этот код создаёт специальный путь (форму), который можно использовать для изменения формы заданного элемента интерфейса (в данном случае UIView).
    func roundUpCorners(view: UIView, corners: UIRectCorner, radius: CGFloat) {
        /*UIBezierPath(roundedRect:byRoundingCorners:cornerRadii:) - это конструктор, который создаёт путь в виде прямоугольника с возможностью закругления только выбранных углов. Этот конструктор принимает три параметра:
         view.bounds - размер и положение прямоугольника, для которого вы создаёте путь. Это говорит, что путь должен покрывать весь элемент UIView.
         corners - указывает, какие углы этого прямоугольника нужно закруглить. Вы можете выбрать любую комбинацию из четырёх углов (topLeft, topRight, bottomLeft, bottomRight).
         CGSize(width: radius, height: radius) - размеры радиуса закругления для углов. Вы задаёте, насколько "мягким" или "острым" будет закругление углов.
         */
        let path = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        
        //let mask = CAShapeLayer() - создаём новый слой, который будет использоваться как маска. Это как шаблон, который определит, какие части другого элемента (в данном случае UIView) будут видимы.
        let mask = CAShapeLayer()
        
        //mask.path = path.cgPath - устанавливаем форму этого шаблона. Мы рисуем форму с помощью UIBezierPath, которая говорит, что нужно закруглить определённые углы. Затем мы передаём эту форму нашему слою-маске.
        mask.path = path.cgPath
        
        //view.layer.mask = mask - применяем наш шаблон-маску к UIView. Это означает, что на UIView будут видны только те части, которые попадают внутрь формы, определённой маской. Всё, что находится за пределами этой формы, будет скрыто.
        view.layer.mask = mask
        //Этот код создает маску, которая закругляет только верхние углы UIView, оставляя нижние углы незакругленными.
    }
    
    
}

//MARK: - Рассширение FirstVC
extension FirstVC {
    
    //Создание Картинки Айфона
    private func makeImageViewIphone() -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Pen")
        imageView.contentMode = .scaleAspectFill
        
        
        return imageView
    }
    
    //Создание Констрейтов Картинки Айфона
    private func makeConstrainsImageViewIphone() {
        imageViewIphone.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageViewIphone.topAnchor.constraint(equalTo: view.topAnchor, constant: 420),
            imageViewIphone.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -5),
            imageViewIphone.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20),
            imageViewIphone.heightAnchor.constraint(equalToConstant: 50),
            
        ])
    }
    
    //Создание View
    private func makeView() -> UIView {
        let view = UIView()
        view.backgroundColor = .white
        
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
        let attributeText = NSMutableAttributedString(string: "Знайдіть Свою Iдеальну Lamy Та Відчуйте Радість Від Письма")
        
        //Этот вызов метода apply(color:toSubstring:), который, вероятно, является частью расширения NSMutableAttributedString, меняет цвет текста для подстроки "Vast Grocery" на цвет, указанный в переменной color. Это означает, что только слова "Vast Grocery" будут отображаться выбранным цветом.
        attributeText.apply(color: color, toSubstring: "Lamy")
        attributeText.apply(color: color, toSubstring: "Знайдіть")
        
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
            label.topAnchor.constraint(equalTo: viewLayer.topAnchor, constant: 30),
            label.leadingAnchor.constraint(equalTo: viewLayer.leadingAnchor, constant: 25),
            label.trailingAnchor.constraint(equalTo: viewLayer.trailingAnchor, constant: -25),
        ])
    }
    
    
    private func makeSubtitle() -> UILabel {
        let label = UILabel()
        label.text = "Знайдіть ручку, яка вам подобається, і яка допоможе вам покращити свій шлях. Тільки Lamy"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }
    
    private func makeConstrainsSubtitle() {
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            subtitle.topAnchor.constraint(equalTo: label.topAnchor, constant: 115),
            subtitle.leadingAnchor.constraint(equalTo: viewLayer.leadingAnchor, constant: 16),
            subtitle.trailingAnchor.constraint(equalTo: viewLayer.trailingAnchor, constant: -16),
        ])
    }
    
    
    
    //Create Button
    private func makeButtonNavigation() -> UIButton {
        let button = UIButton()
        button.setTitle("Давайте розпочнемо", for: .normal)
        
        button.backgroundColor = color
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.layer.cornerRadius = 10
        
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 340),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        return button
    }
    
    @objc func tapButton() {
        let secondVC = SecondVC()
        navigationController?.pushViewController(secondVC, animated: true)
    }
    
    private func makeLabelSignIn() -> UILabel {
        let label = UILabel()
        label.text = "Вже є аккаунт?"
        label.textColor = .black
        
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }
    
    private func makeSignInButton() -> UIButton {
        let button = UIButton()
        let text = "Увійти"
        let attributeText = NSMutableAttributedString(string: text)
        
        // Применение метода расширения для подчеркивания всего текста
        attributeText.underLine(subString: text)
        
        // Установка атрибутизированного текста как заголовка для кнопки
        button.setAttributedTitle(attributeText, for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        
        return button
    }
    
    
    
    //MARK: - Создание StackView
    private func stackViewLabelEndButton() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = NSLayoutConstraint.Axis.horizontal
        stackView.alignment = .center
        stackView.spacing = 5
        
        stackView.addArrangedSubview(labelSignIn)
        stackView.addArrangedSubview(signInButton)
        
        return stackView
    }
    
    private func stackViewCircls() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = NSLayoutConstraint.Axis.vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing = 25
        
        stackView.addArrangedSubview(buttonNavigation)
        stackView.addArrangedSubview(stackViewLabelEndButton())
        
        
        return stackView
    }
    
    private func stackViewCirclsConstrains() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: viewLayer.centerXAnchor),
            stackView.trailingAnchor.constraint(equalTo: viewLayer.trailingAnchor, constant: -16),
            stackView.leadingAnchor.constraint(equalTo: viewLayer.leadingAnchor, constant: 16),
            stackView.bottomAnchor.constraint(equalTo: viewLayer.bottomAnchor, constant: -40),
            
        ])
    }
    
    
}

#Preview {
    FirstVC()
}

