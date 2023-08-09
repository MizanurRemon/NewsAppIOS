//
//  DetailsViewController.swift
//  NewsAppIOS
//
//  Created by Mizanur Remon on 9/8/23.
//

import UIKit

class DetailsViewController: UIViewController {


    @IBOutlet weak var titleText: UITextView!
    
    var detailsTitle : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        titleText.text = detailsTitle
        print(detailsTitle)
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
