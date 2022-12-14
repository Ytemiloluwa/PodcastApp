//
//  Store.swift
//  PodcastApp
//
//  Created by Temiloluwa on 26/11/2022.
//

import Foundation
import Combine

class Store: ObservableObject {
    // notify views that will use it whenever it changes
    @Published private(set) var apiState = AppState.Api()
    @Published private(set) var coreDataState = AppState.CoreData()
    
    private var subscription = Set<AnyCancellable>()
    
    private let enviroment: AppEnvironment
    
    init(enviroment: AppEnvironment = AppEnvironment()) {
        
        self.enviroment = enviroment
    }
    
    func dispatch(_ action: Action) {
        
        switch action {
            
        case.api(let action):
            // calling appropriate reducer based on the action emmited by views
            ApiReducer.execute(action: action, state: apiState, environment: enviroment) { [weak self] state in
                
                self?.apiState = state
            }.store(in: &subscription)
        case .coreData(let action):
            CoreDataReducer.execute(action: action, state: &coreDataState, environment: enviroment)
        }
    }
    
}
 
