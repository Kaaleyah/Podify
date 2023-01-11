//
//  APIService.swift
//  Podify
//
//  Created by Furkan Can Baytemur on 11.01.2023.
//

import Foundation
import Alamofire

class APIService {
    
    let baseiTunesAPIURL = "https://itunes.apple.com/search"
    
    //Singleton
    static let shared = APIService()
    
    func fetchPodcasts(_ searchText: String, completionHandler: @escaping ([Podcast]) -> ()) {
        print("Searching for podcasts")
        
        
        let parameters = ["term": searchText, "media": "podcast"]
        
        AF.request(baseiTunesAPIURL, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).response { response in
            if let err = response.error {
                print("Failed to contact", err)
                return
            }
            
            guard let data = response.data else { return }
                        
            do {
                let searchResult = try JSONDecoder().decode(SearchResults.self, from: data)
                
                completionHandler(searchResult.results)
                
            } catch let decodeErr {
                print("Failed to decode: ", decodeErr)
            }
        }
    }
    
    struct SearchResults: Decodable {
        let resultCount: Int
        let results: [Podcast]
    }
}
