//
//  CharacterModel.swift
//  projetoRickMorty
//
//  Created by Joao Tavares on 02/08/23.
//

import Foundation
import UIKit

class CharacterModel {
    let id: Int?
    let name: String?
    let status: String?
    let species: String?
    let gender: String?
    let image: String?
    let url: String?
    let origin: String?
    let location: String?

    init(id: Int? = nil,
         name: String? = nil,
         status: String? = nil,
         species: String? = nil,
         gender: String? = nil,
         image: String? = nil,
         url: String? = nil,
         origin: String? = nil,
         location: String? = nil) {
        self.id = id
        self.name = name
        self.status = status
        self.species = species
        self.gender = gender
        self.image = image
        self.url = url
        self.origin = origin
        self.location = location
    }

    func getDescription() -> String {
        let statusDescription = status ?? "No Status"
        let speciesDescription = species ?? "Unknown"
        return "\(speciesDescription), \(statusDescription)"
    }
}
