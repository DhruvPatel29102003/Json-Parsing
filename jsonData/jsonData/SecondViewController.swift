//
//  SecondViewController.swift
//  jsonData
//
//  Created by Droadmin on 6/19/23.
//

import UIKit

class SecondViewController: UIViewController {
    var summaryText: String = ""
    @IBOutlet weak var sc1: UIScrollView!
    
    @IBOutlet weak var lblsummary: UILabel!
    @IBOutlet weak var view1: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblsummary.text = summaryText
        
        // Do any additional setup after loading the view.
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
