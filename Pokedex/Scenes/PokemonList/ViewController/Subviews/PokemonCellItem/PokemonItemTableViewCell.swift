//
//  PokemonItemTableViewCell.swift
//  Pokedex
//
//  Created by Oguz Tandogan on 11.02.2024.
//

import UIKit
import Kingfisher

class PokemonItemTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var pokemonImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(cellData: PokemonListTableViewCellData) {
        titleLabel.text = cellData.title
        descriptionLabel.text = cellData.description
        pokemonImageView.kf.setImage(with: URL(string: (cellData.imageUrl)))
    }
}
