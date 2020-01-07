//
//  ViewController.swift
//  Currency_Exchange
//
//  Created by Chelsi Christmas on 1/6/20.
//  Copyright © 2020 Chelsi Christmas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var countryCode = "" {
        didSet{
            
        }
    }
    var allCountryCodes: Rate?
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        updateUI()
        // Do any additional setup after loading the view.
    }
    
    func updateUI() {
        nextButton.isHidden = true
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.isEnabled = false
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let detailVC = segue.destination as? DetailViewController
            else {
                fatalError("Unable to access DetailViewController")
        }
        
        detailVC.currency = countryCode
        detailVC.rate = allCountryCodes
    }
    
    func getCountries(countryCode: String) {
        CurrencySearchAPI.fetchInfo( completion: { (result) in
            switch result{
            case .failure(let appError):
                print("error \(appError)")
            case .success(let allCountryCodes):
                self.allCountryCodes = allCountryCodes
                dump(allCountryCodes)
            }
            
        })
    }
    
}



extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if let text = textField.text {
            countryCode = text
        }
        
        nextButton.isHidden = false
        nextButton.backgroundColor = UIColor.blue
        nextButton.isEnabled = true
        getCountries(countryCode: countryCode)
        
        
       
        
        return true
    }
    
}
