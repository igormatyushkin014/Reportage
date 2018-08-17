//
//  MainViewController.swift
//  ReportageDemo
//
//  Created by Igor Matyushkin on 17.08.2018.
//  Copyright © 2018 Igor Matyushkin. All rights reserved.
//

import UIKit
import Reportage

class MainViewController: UIViewController {
    
    // MARK: Class variables & properties
    
    // MARK: Public class methods
    
    // MARK: Private class methods
    
    // MARK: Initializers
    
    // MARK: Deinitializer
    
    deinit {
    }
    
    // MARK: Outlets
    
    // MARK: Object variables & properties
    
    // MARK: Public object methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationBar()
        self.logDebugInformation()
    }
    
    // MARK: Private object methods
    
    fileprivate func setupNavigationBar() {
        self.navigationItem.title = "Main"
    }
    
    fileprivate func logDebugInformation() {
        let text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        
        Logger.shared
            .width(80)
            .offset(40)
            .offsetPattern(" ")
            .print(text)
    }
    
    // MARK: Actions
    
}
