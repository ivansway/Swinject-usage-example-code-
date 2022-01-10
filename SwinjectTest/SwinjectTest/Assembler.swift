//
//  Assembler.swift
//  Assembler
//
//  Created by Ivan Myrza on 10.01.2022.
//

import Swinject

// регистрация сущностей которые занимаются регистрацией объектов
extension Assembler {
    static let sharedAssembler: Assembler = {
        let container = Container()
        let assembler = Assembler([DateServiceAssembly(), EndViewControllerAssembly()], container: container)
        return assembler
    }()
}
