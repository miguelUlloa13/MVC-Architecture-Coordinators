//
//  CharacterDetailCoordinatorPush.swift
//  MVC Architecture + Coordinators
//
//  Created by Miguel Angel Bric Ulloa on 07/05/23.
//

import Foundation
import UIKit

class CharacterDetailPushCoordinator: Coordinator {
    var viewController: UIViewController?
    var navigationController: UINavigationController?

    
    let characterModel: CharacterDataModel

    init (navigationController: UINavigationController?, characterModel: CharacterDataModel) {
        self.navigationController = navigationController
        self.characterModel = characterModel
    }
    
    func start() {
        let characterDetailViewController = CharacterDetailViewController (characterDataModel: characterModel)
        navigationController?.pushViewController(characterDetailViewController, animated: true)
    }
    
}
