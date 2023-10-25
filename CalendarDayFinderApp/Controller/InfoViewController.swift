//
//  InfoViewController.swift
//  CalendarDayFinderApp
//
//  Created by Arkadijs Makarenko on 23/10/2023.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var appInfoLabel: UILabel!
    @IBOutlet weak var appDescLabel: UILabel!
    var info: String?
    var yourDateShown: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        #warning("assigned value to labels")
        // Do any additional setup after loading the view.
        appInfoLabel.text = info
        appDescLabel.text = yourDateShown
    }
    

}
