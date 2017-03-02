//
//  Repository.swift
//  PersistenceStudy
//
//  Created by alex livenson on 3/1/17.
//  Copyright © 2017 alex livenson. All rights reserved.
//

import Foundation
import RxSwift
import Realm
import RealmSwift
import RxRealm

func abstractMethod() -> Never {
    fatalError("abstract method")
}

protocol RepositoryType {
    associatedtype T
    func queryAll() -> Observable<[T]>
    func save(entity: T) -> Observable<Void>
    func query(predicate: NSPredicate) -> Observable<[T]>
}

class AbstractRepository<T>: RepositoryType {
    func queryAll() -> Observable<[T]> {
        abstractMethod()
    }
    
    func save(entity: T) -> Observable<Void> {
        abstractMethod()
    }
    
    func query(predicate: NSPredicate) -> Observable<[T]> {
        abstractMethod()
    }
    
}

final class Repository<T: RealmConvertable>: AbstractRepository<T> where T == T.RealmType.DomainType, T.RealmType: Object {
    
    private let realm: Realm
    
    override init() {
        realm = try! Realm()
    }
    
    override func queryAll() -> Observable<[T]> {
        return .just([])
    }
    
    override func save(entity: T) -> Observable<Void> {
        return .just()
    }
    
    override func query(predicate: NSPredicate) -> Observable<[T]> {
        return Observable.deferred {
            return .just(self.realm.objects(T.RealmType.self)
                .filter(predicate)
                .toArray()
                .map { $0.asDomain() }
            )
        }
//        .subscribe()
    }
}
