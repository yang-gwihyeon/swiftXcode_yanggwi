//
//  QueryModel.swift
//  ServerJson_01
//
//  Created by TJ on 2022/06/19.
//

import Foundation

protocol QueryModelProtocol: AnyObject{

func itemDownloaded(items: [DBModel])

}

struct QueryModel{
    
    var delegate: QueryModelProtocol!
    let urlPath = "https://zeushahn.github.io/Test/ios/movies.json"

    func downloadItems(){
        print("download Items")
        let url: URL = URL(string: urlPath)!

        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)

        let tast = defaultSession.dataTask(with: url){(data, response, error) in
            if error != nil{
                print("Failed to download data")
            }else{
                print("Data is downloaded")
                self.parseJSON(data!)
            }
        }
        tast.resume()
    }
    
    
    func parseJSON(_ data: Data){
        print("JSON Parsing")
        // JSON to String

        // --- 찍어보기
//        let str = String(decoding: data, as: UTF8.self)
//        print(str)

        let decoder = JSONDecoder()

        var locations: [DBModel] = []

        do{

        let students = try decoder.decode([StudentJSON].self, from: data)

        for student in students{

        let query = DBModel(image: student.image, title: student.title)

        locations.append(query)
            }
            print("Count : \(students.count)")


        }catch let error{
            print("Fail : \(error.localizedDescription)")
        }

        //여러 주소의 JSON을 동시에 가져오는 역핧
        DispatchQueue.main.async(execute: {() -> Void in
            self.delegate.itemDownloaded(items: locations)
            print("Query Model Async")
        })

    }
}
