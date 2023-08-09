//
//  MapperCharacter.swift
//  projetoRickMorty
//
//  Created by Joao Tavares on 31/07/23.
//

import Foundation
import UIKit

class Mapper {
    static func toCharacter(_ DTO: CharacterDTO) -> CharacterModel {
        return CharacterModel(id: DTO.id,
                              name: DTO.name,
                              status: DTO.status,
                              species: DTO.species,
                              gender: DTO.gender,
                              image: DTO.image,
                              url: DTO.url,
                              origin: DTO.origin?.name,
                              location: DTO.location?.name)
    }
}
