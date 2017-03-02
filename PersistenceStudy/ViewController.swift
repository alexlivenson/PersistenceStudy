//
//  ViewController.swift
//  PersistenceStudy
//
//  Created by alex livenson on 3/1/17.
//  Copyright © 2017 alex livenson. All rights reserved.
//

import UIKit
import Realm
import RealmSwift
import RxRealm
import RxSwift

class ViewController: UIViewController {
    
    let bag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let usecase = RMFetchItemUseCase(repo: Repository<Item>())
        usecase.query(byId: 2)
            .subscribe(
                onNext: {
                    print($0)
                }
            )
            .addDisposableTo(bag)
            
//        let realm = try! Realm()
//        
//        let result = realm.objects(RMItem.self).first { $0.id == 2 }
//        print("////// no data")
//        print(result?.asDomain())
//        
//        let item = Item(id: 2, title: "Hello World")
//        try! realm.write {
//            realm.add(item.asRealm())
//        }
//        
//        print("///////SHOULD HAVE DATA")
//        print(realm.objects(RMItem.self).first { $0.id == 2 })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

