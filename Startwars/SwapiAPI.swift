//
//  SwapiAPI.swift
//  Startwars
//
//  Created by Vaibhav Anand on 2020-12-15.
//

import Foundation

enum ApiError: Error {
    case invalidJSONData
    case testError
}

struct SwapiAPI {
    
    private static let baseURL = "http://swapi.dev/api/"
    
    static func filmsURL() -> URL {
        let path:String = "films/"
        return URL(string: baseURL + path)!
    }
    
    static func flims(formJSON data: Data) -> FilmsResult {
        do {
            let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any]
            guard
                let jsonDictionary = jsonObject,
                let flims = jsonDictionary["results"] as? [[String: Any]]
            else {
                return.failure(ApiError.invalidJSONData)
            }
            var finalFilms = [Film]()
            for filmsJson in flims {
                guard
                    let title = filmsJson["title"] as? String,
                    let episodeId = filmsJson["episode_id"] as? Int,
                    let openingCrawl = filmsJson["opening_crawl"] as? String,
                    let director = filmsJson["director"] as? String,
                    let producer = filmsJson["producer"] as? String,
                    let releaseDate = filmsJson["release_date"] as? String,
                    let charactersURLs = filmsJson["characters"] as? [String],
                    let planetsURLs = filmsJson["planets"] as? [String],
                    let starshipsURLs = filmsJson["starships"] as? [String],
                    let vehiclesURLs = filmsJson["vehicles"] as? [String],
                    let speciesURLs = filmsJson["species"] as? [String]
                else {
                    return.failure(ApiError.testError)
                }
                let finalfilm = Film(title: title, episodeId: episodeId, openingCrawl: openingCrawl, director: director, producer: producer, releaseDate: releaseDate, charactersURLs: charactersURLs, planetsURLs: planetsURLs, starshipsURLs: starshipsURLs, vehiclesURLs: vehiclesURLs, speciesURLs: speciesURLs)
                finalFilms.append(finalfilm)
            }
            return(.success(finalFilms))
        } catch let error {
            return .failure(error)
        }
    }
    
    static func name(fromJson data: Data) -> NameResult {
        do {
            let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any]
            guard
                let jsonDictionary = jsonObject as? [String: Any],
                let name = jsonDictionary["name"] as? String else {
                return.failure(ApiError.invalidJSONData)
            }
            return .success(name)
        }
        catch let error {
            return .failure(error)
        }
    }
}
