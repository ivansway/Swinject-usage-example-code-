//
//  DateService.swift
//  DateService
//
//  Created by Ivan Myrza on 10.01.2022.
//

import Foundation

// рандомный сервис
class GetUserInfo {
    var userInfo: String
   
    init(userInfo: String) {
        self.userInfo = userInfo
        printUserInfo()
    }
    func printUserInfo() {
        print(userInfo)
    }
}
