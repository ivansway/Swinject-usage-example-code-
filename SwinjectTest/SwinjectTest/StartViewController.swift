//
//  ViewController.swift
//  SwinjectTest
//
//  Created by Ivan Myrza on 29.12.2021.
//

import UIKit
import Swinject

class StartViewController: UIViewController {
    
    var product: Product!
          
    private var openEndViewControllerButton: UIButton = {
       let button = UIButton()
        button.frame = CGRect(x: 60, y: 400, width: 260, height: 40)
        button.setTitle("Open End View Controller", for: .normal)
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    private var getUserInfoButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 60, y: 500, width: 200, height: 40)
        button.setTitle("Get User Info", for: .normal)
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    private var theTitle: UITextField = {
        let textField = UITextField()
        textField.frame = CGRect(x: 60, y: 300, width: 300, height: 40)
        textField.backgroundColor = .white
        textField.textColor = .blue
        return textField
    }()
    
    private var saveButton: UIButton = {
       let button = UIButton()
        button.frame = CGRect(x: 60, y: 200, width: 200, height: 40)
        button.setTitle("Save User Info", for: .normal)
        button.backgroundColor = .red
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        setButtons()
    }
    
    private func setButtons() {
        view.addSubview(openEndViewControllerButton)
        view.addSubview(getUserInfoButton)
        view.addSubview(theTitle)
        view.addSubview(saveButton)
        openEndViewControllerButton.addTarget(self, action: #selector(openEndViewController), for: .touchUpInside)
        getUserInfoButton.addTarget(self, action: #selector(getUserInfo), for: .touchUpInside)
        saveButton.addTarget(self, action: #selector(saveUserInfo), for: .touchUpInside)
    }
    
    @objc private func openEndViewController() {
        // не боимся !, все норм, так и статья говорит (на которую ссылается дока) и в одном из прошлых моих проектов так сделано
//        let endViewController = Assembler.sharedAssembler.resolver.resolve(EndViewController.self, argument: "register EndViewController works")!
        // обращаемся к нужным свойствам
//        let _ = endViewController.someString
//        navigationController?.pushViewController(endViewController, animated: true)
//        delegate?.showEndViewController()
//        let coordinator = Assembler.sharedAssembler.resolver.resolve(Coordinator.self)!
        let coordinator = Coordinator(container: Container(), navController: navigationController ?? UINavigationController())
        coordinator.showEndViewController()
    }
    
    @objc private func getUserInfo() {
        // не боимся !, все норм, так и статья говорит (на которую ссылается дока) и в одном из прошлых моих проектов так сделано
        let _ = Assembler.sharedAssembler.resolver.resolve(GetUserInfo.self)!
        
        let fetcher = Assembler.sharedAssembler.resolver.resolve(Fetcher.self)!
        fetcher.fetchProduct(id: 1) { [unowned self] product in
            DispatchQueue.main.async {
                self.theTitle.text = product.title
            }
            self.product = product
        }
        let _ = Assembler.sharedAssembler.resolver.resolve(DataFetcher.self, name: "dataFetcher", argument: "dataFetcher works")!
    }
    
    @objc private func saveUserInfo() {
        let saver = Container.sharedContainer.resolve(Saver.self)!
        saver.saveUserInfo(title: product.title)
    }
}
