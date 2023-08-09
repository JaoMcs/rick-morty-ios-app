//
//  DataSource.swift
//  projetoRickMorty
//
//  Created by Joao Tavares on 31/07/23.
//

import Alamofire
import UIKit

class Request {
    //MARK: - typealias result
    typealias ResultDTOCompletionHandler = (Swift.Result<ResultDTO , Error>) -> Void
    typealias CharactersCompletionHandler = (Swift.Result<[CharacterModel] , Error>) -> Void

    typealias CharacterDTOCompletionHandler = (Swift.Result<CharacterDTO , Error>) -> Void
    typealias CharacterCompletionHandler = (Swift.Result<CharacterModel , Error>) -> Void

    typealias loadImageCompletionHandler = (Swift.Result<UIImage , Error>) -> Void

    //MARK: - URLs Strings
    static let urlBase = "https://rickandmortyapi.com/api"
    static let character = "/character"


    //MARK: - GETs
    func getCharacters(from url: String = urlBase + character,
                       _ completation: @escaping CharactersCompletionHandler) {
        RequestResultDTO(from: url) { response in
            switch response {
            case .success(let resultDTO):
                if let results = resultDTO.results {
                    let character = results.map { Mapper.toCharacter($0) }
                    completation(.success(character))
                } else {
                    completation(.failure(Error.self as! Error))
                }
            case .failure(let error):
                completation(.failure(error))
            }
        }
    }

    func getCharacter(from url: String = urlBase + character,
                      _ completation: @escaping CharacterCompletionHandler) {

        RequestCharacterDTO(from: url) { response in
            switch response {
            case .success(let resultDTO):
                let character = Mapper.toCharacter(resultDTO)
                completation(.success(character))
            case .failure(let error):
                completation(.failure(error))
            }
        }
    }

    //MARK: - Requests
    func RequestResultDTO(from url: String,
                _ completation: @escaping ResultDTOCompletionHandler) {
        AF.request(url)
            .responseDecodable(of: ResultDTO.self) { response in
            switch response.result {
            case .success(let data):
                completation(.success(data))
            case .failure(let error):
                completation(.failure(error))
            }
        }
    }

    func RequestCharacterDTO(from url: String,
                _ completation: @escaping CharacterDTOCompletionHandler) {
        AF.request(url)
            .responseDecodable(of: CharacterDTO.self) { response in
            switch response.result {
            case .success(let data):
                completation(.success(data))
            case .failure(let error):
                completation(.failure(error))
            }
        }
    }


    //MARK: - Download
    func loadImage(from urlString: String?, completion: @escaping loadImageCompletionHandler) {
        guard let imageString = urlString,
              let url = URL(string: imageString) else {
//            completion(.failure(Error.self as! Error))
//            Pensar em tratar esse erro
            return
        }

        AF.request(url).responseData { response in
            switch response.result {
            case .success(let data):
                if let uiImage = UIImage(data: data) {
                    completion(.success(uiImage))
                } else {
                    completion(.failure(Error.self as! Error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
