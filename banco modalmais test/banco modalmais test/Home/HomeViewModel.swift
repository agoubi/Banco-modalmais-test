//
//  HomeViewModel.swift
//  banco modalmais test
//
//  Created by zied on 24/12/19.
//  Copyright © 2019 zied. All rights reserved.
//

import Foundation
import RxSwift

class HomeViewModel {
    
    //MARK: - Properties
    let reloadDataObservable = PublishSubject<Void>()
    let loadingObservable = PublishSubject<Bool>()
    public var repositories: [RepositoryModel] = []
    var start : Int = 1
    var isloading : Bool = false
    var haveMore : Bool = true
    //MARK: - Initializers
    
    public init() {
        
    }
    
    //MARK: - Business logic
    
    public func viewDidLoad(start: Int=1) {
        handleData(start: start)
    }
    
    func handleData(start: Int){
        loadingObservable.onNext(true)
        ApiRequests.instance.getAllRepositories(page: start) { (success, data) in
            
            if start == 1 {
                self.repositories.removeAll()
                self.haveMore = true
            }
            self.start = start
            self.isloading = false
            
            if success {
                DispatchQueue.global(qos: .userInitiated).async {
                    guard let unwrapedData = data else {return}
                    guard let jsonString = String(data: unwrapedData, encoding: .utf8) else {return}
                    guard let jsonData = jsonString.data(using: .utf8) else { return }
                    
                    do {
                        let repos = try JSONDecoder().decode(RepositoriesModel.self, from: jsonData)
                        guard let reposResponse = repos.items else { return }
                        self.repositories.append(contentsOf: reposResponse)
                        self.loadingObservable.onNext(false)
                        self.reloadDataObservable.onNext(())
                    } catch let error as NSError {
                        print("json parse error: \(error.localizedDescription)")
                        self.loadingObservable.onNext(false)
                        self.haveMore = false
                    }
                }
            } else {
                print("Network service error")
                self.loadingObservable.onNext(false)
                self.haveMore = false
            }
        }
    }
    
    //MARK: - FUnctions
    func orderListRepositories(orderListFilter: [FilterModel], filters: [FilterModel]) {
        ///Order the list of repository
        if orderListFilter.count > 0 && orderListFilter[0].title == "CRESCENTE" {
        
            if filters.contains(where: { $0.title == "DATA" })
                   && filters.contains(where: { $0.title == "ESTRELAS" }) {
                repositories = repositories.sorted(by: { (stringToDate(dateString: $0.created_at!), $0.stargazers_count ?? 0) > (stringToDate(dateString: $1.created_at!), $1.stargazers_count ?? 0)})
            } else if filters.contains(where: { $0.title == "DATA" })
                   && filters.contains(where: { $0.title == "SEGUIDORE" }) {
                repositories = repositories.sorted(by: { (stringToDate(dateString: $0.created_at!), $0.watchers_count ?? 0) > (stringToDate(dateString: $1.created_at!), $1.watchers_count ?? 0)})
            }else if filters.contains(where: { $0.title == "ESTRELAS" }) {
                repositories = repositories.sorted(by: { $0.stargazers_count ?? 0 > $1.stargazers_count ?? 0})
            } else if filters.contains(where: { $0.title == "SEGUIDORE" }) {
                repositories = repositories.sorted(by: { $0.watchers_count ?? 0 > $1.watchers_count ?? 0})
            } else if filters.contains(where: { $0.title == "DATA" }) {
                repositories = repositories.sorted(by: { stringToDate(dateString: $0.created_at!) > stringToDate(dateString: $1.created_at!)})
            }
            
        } else if orderListFilter.count > 0 && orderListFilter[0].title == "DECRESCENTE" {
           
            if filters.contains(where: { $0.title == "DATA" })
                   && filters.contains(where: { $0.title == "ESTRELAS" }) {
                repositories = repositories.sorted(by: { (stringToDate(dateString: $0.created_at!), $0.stargazers_count ?? 0) < (stringToDate(dateString: $1.created_at!), $1.stargazers_count ?? 0)})
            } else if filters.contains(where: { $0.title == "DATA" })
                   && filters.contains(where: { $0.title == "SEGUIDORE" }) {
                repositories = repositories.sorted(by: { (stringToDate(dateString: $0.created_at!), $0.watchers_count ?? 0) < (stringToDate(dateString: $1.created_at!), $1.watchers_count ?? 0)})
            } else if filters.contains(where: { $0.title == "ESTRELAS" }) {
               repositories = repositories.sorted(by: { $0.stargazers_count ?? 0 < $1.stargazers_count ?? 0})
           } else if filters.contains(where: { $0.title == "SEGUIDORE" }) {
               repositories = repositories.sorted(by: { $0.watchers_count ?? 0 < $1.watchers_count ?? 0})
           } else if filters.contains(where: { $0.title == "DATA" }) {
               repositories = repositories.sorted(by: { stringToDate(dateString: $0.created_at!) < stringToDate(dateString: $1.created_at!)})
           }
        }
    }
    
    public func stringToDate(dateString:String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.locale = Locale.init(identifier: "pt-br")
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        let dateRequest = dateFormatter.date(from: dateString)!
        return dateRequest
    }
    
}

extension HomeViewModel {
    func toDate(_ value: String) -> String? {
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ssZZZ"
           guard let date = dateFormatter.date(from: value) else {return nil}
           dateFormatter.dateFormat = "dd-MM-yyyy"
           dateFormatter.string(from: date)
           return dateFormatter.string(from: date)
    }
}
