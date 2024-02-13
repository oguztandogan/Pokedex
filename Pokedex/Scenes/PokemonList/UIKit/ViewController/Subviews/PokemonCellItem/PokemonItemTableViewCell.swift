//
//  PokemonItemTableViewCell.swift
//  Pokedex
//
//  Created by Oguz Tandogan on 11.02.2024.
//

import UIKit

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
//        pokemonImageView.kf.setImage(with: URL(string: (cellData.imageUrl)))
        ImageDownloader.shared.downloadImage(from: URL(string: (cellData.imageUrl))!) { image in
//            image?.prepareForDisplay { [weak self] preparedImage in
//                DispatchQueue.main.async {
//                    self?.imageView.image = preparedImage
//                }
//            }
            Task {
                self.pokemonImageView.image = await image?.byPreparingForDisplay()
            }
        }
    }
}

import SwiftUI
class ImageDownloader {
    static let shared = ImageDownloader()

    func downloadImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            completion(UIImage(data: data))
        }.resume()
    }

}
