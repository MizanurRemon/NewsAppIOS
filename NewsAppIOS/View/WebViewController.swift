//
//  WebViewController.swift
//  NewsAppIOS
//
//  Created by Mizanur Remon on 10/8/23.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {
    
    var newsUrl : String = ""

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        

        webView.navigationDelegate = self
        webView.load(URLRequest(url: URL(string: newsUrl)!))
        
        
        print(newsUrl)
    }
    


}
