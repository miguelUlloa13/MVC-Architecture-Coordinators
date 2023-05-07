//
//  MainCoordinator.swift
//  MVC Architecture + Coordinators
//
//  Created by Miguel Angel Bric Ulloa on 07/05/23.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    
    var viewController: UIViewController?
    var navigationController: UINavigationController?
    
    init (navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let UINib = UINib(nibName: "nib file name", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
    
}
