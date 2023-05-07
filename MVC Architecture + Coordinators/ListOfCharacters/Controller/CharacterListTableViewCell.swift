//
//  PokemonListTableViewCell.swift
//  MVC Architecture + Coordinators
//
//  Created by Miguel Angel Bric Ulloa on 06/05/23.
//

import UIKit

class CharacterListTableViewCell: UITableViewCell {
    
    //

    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var characterID: UILabel!
    @IBOutlet weak var characterNameLbl: UILabel!
    @IBOutlet weak var characterSpecie: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
