//
//  EventListCoordinator.swift
//  EventApp
//
//  Created by Omer Rahmanovic on 7/18/20.
//  Copyright © 2020 Delta Software LLC. All rights reserved.
//

import UIKit

final class EventListCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let eventListViewController = EventListViewController.instantiate()
        navigationController.setViewControllers([eventListViewController], animated: false)
    }
    
    
}
