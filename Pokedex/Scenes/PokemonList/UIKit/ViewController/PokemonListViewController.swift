//
//  PokemonListViewController.swift
//  Pokedex
//
//  Created by Oguz Tandogan on 13.02.2024.
//

import Foundation
import UIKit
import Combine

class PokemonListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var viewModel: PokemonListViewModel!
    var cancellables: Set<AnyCancellable> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        bindTableView()
        Task {
            await viewModel.fetchPokemons()
        }
        self.navigationItem.title = "Pokemon"
    }
    
    private func bindTableView() {
        viewModel.$pokemonList
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.tableView.reloadData()
            }
            .store(in: &cancellables)
    }
    
    private func setupTableView() {
        let nib = UINib(nibName: "PokemonItemTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "PokemonItemTableViewCell")
    }
}

extension PokemonListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.pokemonList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "PokemonItemTableViewCell") as? PokemonItemTableViewCell
        else { return UITableViewCell() }
        cell.setData(cellData: viewModel.setData(index: indexPath.row))
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.navigateToPokemonDetails(index: indexPath.row)
    }
}
