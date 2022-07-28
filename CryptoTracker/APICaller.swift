//
//  APICaller.swift
//  CryptoTracker
//
//  Created by Артем Сергеев on 27.07.2022.
//

import Foundation

final class APICaller {
    
    static let shared = APICaller()
    
    private struct Constants {
        static let apiKey = "9DAC0D76-49EC-434B-84A3-1C9E727848E7"
        static let assetsEndPoint = "https://rest.coinapi.io/v1/assets/"
    }
    
    private init() {}
    
    public var icons: [Icon] = []
    
    private var whenReadyBlock: ((Result<[Crypto], Error>) -> Void)?
    
    func getAllCryptoData(completion: @escaping (Result<[Crypto], Error>) -> Void) {
        
        whenReadyBlock = completion
        guard !icons.isEmpty else { return }
        
        guard let url = URL(string: Constants.assetsEndPoint + "?apikey=" + Constants.apiKey) else {return}
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else { return }
            
            do{
                // Decode response
                let cryptos = try JSONDecoder().decode([Crypto].self, from: data)
                completion(.success(cryptos.sorted { first, second in
                    return first.price_usd ?? 0 > second.price_usd ?? 0 }))
            }
            
            catch{
                completion(.failure(error))
            }
            
        }
        task.resume()
        
    }
    
     func getAllIcons() {
        guard let url = URL(string: "https://rest.coinapi.io/v1/assets/icons/100/?apikey=9DAC0D76-49EC-434B-84A3-1C9E727848E7") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else { return }
            
            do{
                // Decode response
                self?.icons = try JSONDecoder().decode([Icon].self, from: data)
                if let completion = self?.whenReadyBlock {
                    self?.getAllCryptoData(completion: completion)
                }
                
            }
            
            catch{
                print(error)
            }
            
        }
        task.resume()
    }
    
   
}
