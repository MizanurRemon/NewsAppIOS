//
//  NewsViewModel.swift
//  NewsAppIOS
//
//  Created by Mizanur Remon on 11/7/23.
//

import Foundation
class NewsViewModel{
    private var apiConfig = APIConfig()
    private var news = [Articles]()
    
    func getHeadLinesNews(completion: @escaping ()->()){
        apiConfig.getTopStories{result in
            switch result{
            case .success(let response):
                self.news = response.articles
               // print("count:: \(self.news.count)")
                completion()
                break
            case .failure(let error):
                print(error)
                completion()
                break
            }
        }
    }
    
    func numberOfRowsInSection(section: Int)-> Int{
        
        if news.count != 0 {
            return news.count
        }
        
        return 0
    }
    
    func cellForRowAt(indexPath: IndexPath) -> Articles {
        return news[indexPath.row]
    }
    
}
