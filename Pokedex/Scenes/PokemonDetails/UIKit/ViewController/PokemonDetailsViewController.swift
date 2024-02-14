//
//  PokemonDetailsViewController.swift
//  Pokedex
//
//  Created by Oguz Tandogan on 13.02.2024.
//

import UIKit

class PokemonDetailsViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    var viewModel: PokemonDetailsViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        self.navigationItem.title = viewModel.pokemonData?.name
    }
    
    func updateView() {
        imageView.load(url: URL(string: (viewModel.pokemonData?.imageURL)!)!)
        textView.text = viewModel.pokemonData?.description
    }
}
