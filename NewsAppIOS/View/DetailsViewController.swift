//
//  DetailsViewController.swift
//  NewsAppIOS
//
//  Created by Mizanur Remon on 9/8/23.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var articles : Articles?

    @IBOutlet weak var sourceText: UILabel!
    
    @IBOutlet weak var titleText: UILabel!
    
    @IBOutlet weak var contentText: UITextView!
    
    @IBOutlet weak var newsImage: UIImageView!
    
    @IBOutlet weak var authorName: UILabel!
    
    @IBOutlet weak var dateText: UILabel!
    
    @IBOutlet weak var viewLink: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       
        
        loadData()
       
    }
    
    private func loadData(){
        titleText.text = articles?.title
        sourceText.text = "source: \(articles?.source.name ?? "")"
        authorName.text = articles?.author
        dateText.text = articles?.publishedAt
       contentText.text = articles?.content
       // print(articles?.content! ?? "")
        
        guard let imageUrl = URL(string: (articles?.urlToImage)!)else{
            self.newsImage.image = UIImage(named: "loading")
            return
        }
        self.newsImage.image = nil
        getImageFrom(url: imageUrl)
        
        UIConfigure()
    }
    

    private func UIConfigure(){
        self.newsImage.contentMode = .scaleAspectFill
        
        sourceText.font = .systemFont(ofSize: 11)
        sourceText.textColor = .gray
        
        authorName.font = .systemFont(ofSize: 8)
        authorName.textColor = .gray
        
        dateText.font = .systemFont(ofSize: 8)
        dateText.textColor = .gray
        
        viewLink.text = "read full story"
        viewLink.font = .systemFont(ofSize: 10)
        viewLink.textColor = .blue
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(DetailsViewController.opnLink))
        viewLink.isUserInteractionEnabled = true
        viewLink.addGestureRecognizer(tap)
//        viewLink.und
//
        contentText.font = .systemFont(ofSize: 11)
       contentText.textColor = .black
        
        titleText.font = .systemFont(ofSize: 14, weight: .bold)
    }
    
    @objc private func opnLink(){
        //WebViewController
        let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
        
        nextViewController.newsUrl  = articles?.url ?? ""
       
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    private func getImageFrom(url: URL){
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error{
                print("image download error:: \(error)")
                return
            }
            
            guard let data = data else{
                print("empty image")
                return
            }
            
            DispatchQueue.main.async {
                if let image = UIImage(data: data){
                    self.newsImage.image = image
                
                }
            }
        }.resume()
    }

}
