//
//  Convertables.swift
//  PersistenceStudy
//
//  Created by alex livenson on 3/1/17.
//  Copyright © 2017 alex livenson. All rights reserved.
//

import Foundation

protocol DomainConvertable {
    associatedtype DomainType
    func asDomain() -> DomainType
}

protocol RealmConvertable {
    associatedtype RealmType: DomainConvertable
    func asRealm() -> RealmType
}
