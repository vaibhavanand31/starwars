//
//  Films.swift
//  Startwars
//
//  Created by Vaibhav Anand on 2020-12-15.
//

import Foundation

enum FilmsResult {
    case success([Film])
    case failure(Error)
}

enum NameResult {
    case success(String)
    case failure(Error)
}

class Films {
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    func fetchFilms(completion: @escaping (FilmsResult) -> Void) {
        let url = SwapiAPI.filmsURL()
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request){
            (data, response, error) -> Void in
            let result = self.processFilmsResult(data: data, error: error)
            OperationQueue.main.addOperation {
                completion(result)
            }
        }
        task.resume()
    }
    
    func processFilmsResult(data: Data?, error: Error?) -> FilmsResult {
        guard let jsonData = data else {
            return .failure(error!)
        }
        return SwapiAPI.flims(formJSON: jsonData)
    }
    
    func fetchName(for url: String, competion: @escaping (NameResult) -> Void) {
        let givenUrl = URL(string: url)
        let request = URLRequest(url: givenUrl!)
        let task = session.dataTask(with: request){
            (data, response, error) -> Void in
            let result = self.processNameResult(data: data, error: error)
            OperationQueue.main.addOperation {
                competion(result)
            }
        }
        task.resume()
    }
    
    private func processNameResult(data: Data?, error: Error?) -> NameResult {
        guard let jsonData = data else {
            return .failure(error!)
        }
        return SwapiAPI.name(fromJson: jsonData)
    }
}
