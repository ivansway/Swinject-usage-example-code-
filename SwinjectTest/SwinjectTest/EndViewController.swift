//
//  SecondViewController.swift
//  SecondViewController
//
//  Created by Ivan Myrza on 29.12.2021.
//

import UIKit

class EndViewController: UIViewController {
    
    var someString: String
    
    init(someString: String) {
        self.someString = someString
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        print(someString)
    }
}
