//
//  Assembly.swift
//  Assembly
//
//  Created by Ivan Myrza on 10.01.2022.
//

import Swinject

// сущность которая занимается регистрацией объектов (сохраняет ссылку внутри контейнера)
class EndViewControllerAssembly: Assembly {
    func assemble(container: Container) {
        container.register(EndViewController.self) { r -> EndViewController in
            return EndViewController(someString: "register EndViewController works")
        }
        // то как выгружается ссылка на End View Controller из памяти
        .inObjectScope(.graph)
    }
}

// сущность которая занимается регистрацией объектов (сохраняет ссылку внутри контейнера)
class DateServiceAssembly: Assembly {
    func assemble(container: Container) {
        container.register(GetUserInfo.self) { r -> GetUserInfo in
            return GetUserInfo(userInfo: "register GetUserInfo works")
        }
        // то как выгружается ссылка на Get User Info из памяти
        .inObjectScope(.graph)
    }
}
