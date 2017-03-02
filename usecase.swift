//
//  FetchItemUseCase.swift
//  PersistenceStudy
//
//  Created by alex livenson on 3/1/17.
//  Copyright © 2017 alex livenson. All rights reserved.
//

import Foundation
import RxSwift

protocol FetchItemUseCase {
    func query(byId: Int) -> Observable<Item?>
}
