//
//  ViewController.swift
//  Memo cards
//
//  Created by Rimma Katushina on 30/09/2023.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    private let networkManager = NetworkMarager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
   
    @IBOutlet var textTF: UITextField!
    
    @IBAction func translateButtonPressed(_ sender: UIButton) {
        let translate = TranslationRequest(
            
            text: textTF.text ?? "no text",
            target_lang: "EN"
        )
        
        sendPostRequest(with: translate)
    }
    
    @IBOutlet var translateLabel: UILabel!
    
    private func sendPostRequest(with data: TranslationRequest) {
        NetworkMarager.shared.getTranslate(to: TranslateLInk.url.rawValue, with: data) { [weak self] result in
            print("result")

            switch result {
            case .success(let response):
                print("success")
                self?.translateLabel.text = response.translations.first?.text
//                self?.tableView.reloadData()
            case .failure(let error):
                print("error")
                print(error)
                print(error.localizedDescription)
            }
        }
    }
    
}

    

