//
//  EventListViewController.swift
//  EventApp
//
//  Created by Omer Rahmanovic on 7/18/20.
//  Copyright © 2020 Delta Software LLC. All rights reserved.
//

import UIKit
import CoreData

class EventListViewController: UIViewController {
    
    var viewModel: EventListViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        let plusImage = UIImage(systemName: "plus.circle.fill")
        let barButtonItem = UIBarButtonItem(image: plusImage, style: .plain, target: self, action: #selector(tappedAddEventButton))
        barButtonItem.tintColor = .primary
        navigationItem.rightBarButtonItem = barButtonItem
        navigationItem.title = viewModel.title
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    @objc private func tappedAddEventButton() {
        viewModel.tappedAddEvent()
    }
}
