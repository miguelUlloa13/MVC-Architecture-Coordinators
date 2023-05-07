//
//  CharacterDetailCoordinatorModal.swift
//  MVC Architecture + Coordinators
//
//  Created by Miguel Angel Bric Ulloa on 07/05/23.
//

import Foundation
import UIKit

class CharacterDetailModalCoordinator: Coordinator {
    
    var viewController: UIViewController?
    
    let characterModel: CharacterDataModel

    init (viewController: UIViewController?, characterModel: CharacterDataModel) {
        self.viewController = viewController
        self.characterModel = characterModel
    }
    
    func start() {
        let characterDetailViewController = CharacterDetailViewController (characterDataModel: characterModel)
        viewController?.present(characterDetailViewController, animated: true)
    }
    
}
