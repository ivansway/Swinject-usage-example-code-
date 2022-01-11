//
//  Coordinator.swift
//  Coordinator
//
//  Created by Ivan Myrza on 10.01.2022.
//

import Swinject

class Coordinator {
    
    let container: Container
    var navController: UINavigationController?
    init(container: Container, navController: UINavigationController) {
        self.container = container
        self.navController = navController
    }
    
    func showEndViewController() {
        let endViewController = Container.sharedContainer.resolve(EndViewController.self)!
        navController?.pushViewController(endViewController, animated: true)
    }
}
