//
//  Assembly.swift
//  Assembly
//
//  Created by Ivan Myrza on 10.01.2022.
//

import Swinject

// сущность которая занимается регистрацией объектов (сохраняет ссылку внутри контейнера)
class AppAssembly: StartViewController, Assembly {
    func assemble(container: Container) {
        container.register(Coordinator.self) { _ in
            return Coordinator(container: container, navController: UINavigationController())
        }
    }
}

class DateServiceAssembly: Assembly {
    func assemble(container: Container) {
        container.register(GetUserInfo.self) { r -> GetUserInfo in
            return GetUserInfo(userInfo: "register GetUserInfo works")
        }
    }
}

class FetcherAssembly: Assembly {
    func assemble(container: Container) {
        container.register(Fetcher.self) { _ in
            return Fetcher()
        }
    }
}

// регистрация объекта с не инициализированными зависимостями
class DataFetcherAssembly: Assembly {
    func assemble(container: Container) {
        container.register(Fetch.self, name: "fetchFromDataBase") { (_, value: String) in
            return FetchFromDataBase(value: value)
        }
        container.register(Fetch.self, name: "fetchFromServer") { (_, value: String) in
            return FetchFromServer(value: value)
        }
        container.register(Fetch.self, name: "fetchFromFile") { (_, value: String) in
            return FetchFromFile(value: value)
        }
        container.register(Fetch.self, name: "fetchFromSingletone") { (_, value: String) in
            return FetchFromSingletone(value: value)
        }
        
        container.register(DataFetcher.self, name: "dataFetcher") { (resolver, value: String) in
            let fetchFromDataBase = resolver.resolve(Fetch.self, name: "fetchFromDataBase", argument: value)! as! FetchFromDataBase
            let fetchFromServer = resolver.resolve(Fetch.self, name: "fetchFromServer", argument: value)! as! FetchFromServer
            let fetchFromFile = resolver.resolve(Fetch.self, name: "fetchFromFile", argument: value)! as! FetchFromFile
            let fetchFromSingletone = resolver.resolve(Fetch.self, name: "fetchFromSingletone", argument: value)!
            as! FetchFromSingletone
            return DataFetcher(fetchFromDataBase: fetchFromDataBase, fetchFromServer: fetchFromServer, fetchFromFile: fetchFromFile, fetchFromSingletone: fetchFromSingletone)
        }
    }
    
    
}

// регистрация в контейнере 
extension Container {
    static let sharedContainer: Container = {
       let container = Container()
        container.register(EndViewController.self) { _ in
            return EndViewController(someString: "register EndViewController works")
        }
        container.register(Saver.self) { _ in
            return Saver()
        }
        return container
    }()
}
