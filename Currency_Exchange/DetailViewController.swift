//
//  DetailViewController.swift
//  Currency_Exchange
//
//  Created by Chelsi Christmas on 1/6/20.
//  Copyright © 2020 Chelsi Christmas. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    var currency: String?
    var rate: Rate?
    @IBOutlet weak var countryCodeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }
    
    
    func updateUI() {
        countryCodeLabel.text = currency!
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
