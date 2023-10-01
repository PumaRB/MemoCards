//
//  Translate.swift
//  Memo cards
//
//  Created by Rimma Katushina on 30/09/2023.
//

import Foundation

struct TranslationResponse: Codable {
    let translations: [Translations]
}


struct Translations: Codable {
    let detected_source_language: String
    let text: String
}
