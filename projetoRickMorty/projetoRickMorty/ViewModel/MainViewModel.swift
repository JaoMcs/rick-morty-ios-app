//
//  MainViewModel.swift
//  projetoRickMorty
//
//  Created by Joao Tavares on 06/08/23.
//

import Foundation
import UIKit

class MainViewModel {
    var updateTableView: (() -> Void)?
    var request = Request()
    var characters: [CharacterModel]

    init(characters: [CharacterModel] = [CharacterModel()] ) {
        self.characters = characters
    }

    func fetchData() {
        request.getCharacters { result in
            switch result {
            case .success(let result):
                self.characters = result
                self.updateTableView?()
            case .failure(let error):
                // Tratamento de error
                // Modal de erro ou coisa do tipo
                print("Error fetchData, MainViewModel \(error.localizedDescription)")
            }
        }
    }
}
