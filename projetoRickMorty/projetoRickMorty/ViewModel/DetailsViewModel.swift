//
//  DetailsViewModel.swift
//  projetoRickMorty
//
//  Created by Joao Tavares on 09/08/23.
//

import Foundation
import UIKit

class DetailsViewModel {
    var updateImage: (() -> Void)?
    var updateData: (() -> Void)?
    var request = Request()
    var UiImage = UIImage()

    var character: CharacterModel
    var characterUrl: String?

    init(character: CharacterModel = CharacterModel()) {
        self.character = character
    }

    func loadImage() {
        request.loadImage(from: character.image) { result in
            switch result {
            case .success(let image):
                self.UiImage = image
                self.updateImage?()
            case .failure(let error):
                print("Error on loadImage in SetupCell \(error)")
            }
        }
    }

    func fetchData() {
        request.getCharacter(from: getCharacterURL()) { result in
            switch result {
            case .success(let result):
                self.character = result
                self.updateData?()
            case .failure(let error):
                // Tratamento de error
                // Modal de erro ou coisa do tipo
                print("Error fetchData, DetailsViewModel \(error.localizedDescription)")
            }
        }
    }

    func getCharacterURL() -> String {
        return character.url ?? ""
    }
}
