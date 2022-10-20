//
//  NewMessageController.swift
//  Ogus Chat
//
//  Created by AKIN on 20.10.2022.
//

import UIKit

final class NewMessageController: UITableViewController {
    
    // MARK: - Properties
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .systemTeal
    }
}
