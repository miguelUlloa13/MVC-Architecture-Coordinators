//
//  CharacterDetailViewController.swift
//  MVC Architecture + Coordinators
//
//  Created by Miguel Angel Bric Ulloa on 06/05/23.
//

import UIKit
import Kingfisher

class CharacterDetailViewController: UIViewController {
    
    @IBOutlet weak var characterImage: UIImageView!
    
    @IBOutlet weak var characterIDLbl: UILabel!
    @IBOutlet weak var characterNameLbl: UILabel!
    @IBOutlet weak var characterStatusLbl: UILabel!
    @IBOutlet weak var characterSpecieLbl: UILabel!
    
    var characterDataModel: CharacterDataModel
    
    init(characterDataModel: CharacterDataModel) {
        self.characterDataModel = characterDataModel
        super.init(nibName: nil, bundle: nil)
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        characterImage.kf.setImage(with: URL(string: characterDataModel.image))
        setUpLabels()
    }
    
    private func setUpLabels(){

        characterIDLbl.text = characterDataModel.id.description
        characterNameLbl.text = characterDataModel.name
        characterStatusLbl.text = characterDataModel.status
        characterSpecieLbl.text = characterDataModel.species
        
    }

}
