//
//  ViewController.swift
//  SwinjectTest
//
//  Created by Ivan Myrza on 29.12.2021.
//

import UIKit
import Swinject

class StartViewController: UIViewController {
  
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        setButtons()
    }
    
    private func setButtons() {
        view.addSubview(openEndViewControllerButton)
        view.addSubview(getUserInfoButton)
        openEndViewControllerButton.addTarget(self, action: #selector(openEndViewController), for: .touchUpInside)
        getUserInfoButton.addTarget(self, action: #selector(getUserInfo), for: .touchUpInside)
    }
    
    @objc private func openEndViewController() {
        // не боимся !, все норм, так и статья говорит (на которую ссылается дока) и в одном из прошлых моих проектов сделано
        let endViewController = Assembler.sharedAssembler.resolver.resolve(EndViewController.self)!
        navigationController?.pushViewController(endViewController, animated: true)
    }
    
    @objc private func getUserInfo() {
        // не боимся !, все норм, так и статья говорит (на которую ссылается дока) и в одном из прошлых моих проектов сделано
        let _ = Assembler.sharedAssembler.resolver.resolve(GetUserInfo.self)!
    }
}
