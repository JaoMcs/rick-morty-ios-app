//
//  CharacterTableCellViewModel.swift
//  projetoRickMorty
//
//  Created by Joao Tavares on 09/08/23.
//

import Foundation
import UIKit

class CharacterTableCellViewModel {
    var updateImage: (() -> Void)?
    var request = Request()
    var UiImage = UIImage()

    var character: CharacterModel

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
}
