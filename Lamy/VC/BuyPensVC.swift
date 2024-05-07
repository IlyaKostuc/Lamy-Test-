//
//  BuyPensVC.swift
//  Lamy
//
//  Created by Max on 06.05.2024.
//

import UIKit


class BuyPensVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let basketButtonCustom = UIImage(systemName: "bag")
        let basketButton = UIBarButtonItem(image: basketButtonCustom, style: .plain, target: self, action: #selector(tapBasketButton))
        basketButton.tintColor = .gray
        navigationItem.rightBarButtonItem = basketButton
    }

    
    
    @objc func tapBasketButton() {
        print("Tap")
    }
    


}

extension BuyPensVC {
    
}

#Preview {
    BuyPensVC()
}
