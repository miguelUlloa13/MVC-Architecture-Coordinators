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
        let characterListViewController = CharacterListViewController()
        navigationController?.pushViewController(characterListViewController, animated: true)
    }
    
}
