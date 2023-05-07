//
//  Coordinator.swift
//  MVC Architecture + Coordinators
//
//  Created by Miguel Angel Bric Ulloa on 07/05/23.
//

import Foundation
import UIKit

protocol Coordinator {
    var viewController: UIViewController? { get }
    var navigationController: UINavigationController? { get }
    
    func start ()
}

extension Coordinator {
    var viewController: UIViewController? { nil }
    var navigationController: UINavigationController? { nil }
}
