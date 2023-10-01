//
//  NetworkManager.swift
//  Memo cards
//
//  Created by Rimma Katushina on 30/09/2023.
//

import Foundation
import Alamofire

let headers : HTTPHeaders = [
    "Authorization": "DeepL-Auth-Key afed77e3-14a7-af90-8e85-d0828cac39de:fx",
    "Content-Type" : "application/x-www-form-urlencoded"
]

enum TranslateLInk: String {
    case url = "https://api-free.deepl.com/v2/translate"
}

final class NetworkMarager {
    static let shared = NetworkMarager()
    
    private init() {}
    
    func getTranslate(to url: String, with data: TranslationRequest, completion: @escaping(Result<TranslationResponse, AFError>) -> Void) {
        AF.request(url, method: .post, parameters: data, headers: headers)
            .validate()
            .responseDecodable(of: TranslationResponse.self) { DataResponse in
                switch DataResponse.result {
                    
                case .success(let translate):
                    completion(.success(translate))
                    print(translate)
                case .failure(let error):
                    completion(.failure(error))
                }
            
            }
    }
}
