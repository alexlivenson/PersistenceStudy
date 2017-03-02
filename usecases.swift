//
//  usecases.swift
//  PersistenceStudy
//
//  Created by alex livenson on 3/1/17.
//  Copyright © 2017 alex livenson. All rights reserved.
//

import Foundation
import RxSwift

class RMFetchItemUseCase: FetchItemUseCase {
    
    private let repo: AbstractRepository<Item>
    
    init(repo: AbstractRepository<Item>) {
        self.repo = repo
    }
    
    func query(byId: Int) -> Observable<Item?> {
        let p = NSPredicate(format: "id = \(byId)", argumentArray: nil)
        return repo.query(predicate: p)
            .map { $0.first }
    }
}
