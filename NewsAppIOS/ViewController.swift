//
//  ViewController.swift
//  NewsAppIOS
//
//  Created by Mizanur Remon on 11/7/23.
//

import UIKit



class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var newsViewModel = NewsViewModel()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "News"
        view.backgroundColor = .systemBackground
        
        initialize()
        
        topHeadlines()
    }
    
    
    func initialize(){
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.showsVerticalScrollIndicator = false
        self.tableView.showsHorizontalScrollIndicator = false
    }
    
    func topHeadlines(){
        
        newsViewModel.getHeadLinesNews {[weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print(newsViewModel.numberOfRowsInSection(section: section))
        return newsViewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsRowCellID", for: indexPath) as! NewsTableViewCell
     
        
        let news = newsViewModel.cellForRowAt(indexPath: indexPath)
        cell.setCellWithValuesOf(article: news)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let data = newsViewModel.cellForRowAt(indexPath: indexPath)
      //  print(data)
        
        let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        nextViewController.articles = data//JSONEncoder().encode(data)
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    
}

