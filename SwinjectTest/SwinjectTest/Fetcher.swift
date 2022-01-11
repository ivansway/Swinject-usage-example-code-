//
//  FetchProduct.swift
//  FetchProduct
//
//  Created by Ivan Myrza on 11.01.2022.
//

import Foundation

class Fetcher {
    
    func fetchProduct(id: Int, completion: @escaping (Product) -> Void) {
        guard let url = URL(string: "https://fakestoreapi.com/products/\(id)") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            
            do {
                let jsonData = try JSONDecoder().decode(Product.self, from: data)
                completion(jsonData)
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}

protocol Fetch {}

class FetchFromDataBase: Fetch {
    let value: String
    init(value: String) {
        self.value = value
        print(value)
    }
}
class FetchFromServer: Fetch {
    let value: String
    init(value: String) {
        self.value = value
        print(value)
    }
}
class FetchFromFile: Fetch {
    let value: String
    init(value: String) {
        self.value = value
        print(value)
    }
}
class FetchFromSingletone: Fetch {
    let value: String
    init(value: String) {
        self.value = value
        print(value)
    }
}

class DataFetcher {
    
    var fetchFromDataBase: FetchFromDataBase
    var fetchFromServer: FetchFromServer
    var fetchFromFile: FetchFromFile
    var fetchFromSingletone: FetchFromSingletone
    
    init(fetchFromDataBase: FetchFromDataBase,
         fetchFromServer: FetchFromServer,
         fetchFromFile: FetchFromFile,
         fetchFromSingletone: FetchFromSingletone)
    {
        self.fetchFromDataBase = fetchFromDataBase
        self.fetchFromServer = fetchFromServer
        self.fetchFromFile = fetchFromFile
        self.fetchFromSingletone = fetchFromSingletone
    }
}

