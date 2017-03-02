//
//  RMItem.swift
//  PersistenceStudy
//
//  Created by alex livenson on 3/1/17.
//  Copyright © 2017 alex livenson. All rights reserved.
//

import Realm
import RealmSwift
import Foundation

final class RMItem: Object {
    dynamic var id = -1
    dynamic var title = ""
}

extension RMItem: DomainConvertable {
    func asDomain() -> Item {
        return Item(id: id, title: title)
    }
}

extension Item: RealmConvertable {
    func asRealm() -> RMItem {
        let item = RMItem()
        item.id = id
        item.title = title
        return item
    }
}
