//
//  HomeInteractor.swift
//  Epitech-Eisenhower
//
//  Created by Odet Alexandre on 06/03/2018.
//  Copyright © 2018 Odet Alexandre. All rights reserved.
//

import Foundation
import RxSwift

final class HomeInteractor {
    
    deinit {
        restApiTask.cancelRequest()
    }
    
    var output: HomePresenter?
    var restApiTask = RestAPITask()
    private lazy var disposeBag = DisposeBag()
    
    func fetchData() {
        restApiTask.getTaskList().subscribe(
            onNext:{ [weak self] tasklist in
                self?.output?.didFetch(result: tasklist)
        }, onError: { [weak self] error in
            self?.output?.didFail(with: error)
        }).disposed(by: disposeBag)
    }
}
