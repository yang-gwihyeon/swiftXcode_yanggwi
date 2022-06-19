//
//  TableViewController.swift
//  ServerJson_02
//
//  Created by TJ on 2022/06/19.
//

import UIKit
import Alamofire




class TableViewController: UITableViewController {
    
    var resultList: [Results] = []
    var filterData: [Results]!
    
    @IBOutlet var listTableView: UITableView!
    
    @IBOutlet weak var imageView: UIImageView!
    var feedItem: [DBModel] = []
    var imageName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getNewsData()
    
        
        var queryModel = QueryModel()
        
        queryModel.delegate = self
        queryModel.downloadItems()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return feedItem.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! TableViewCell

        // Configure the cell...
        
        cell.codeLabel.text = "학번 : \(String(describing: feedItem[indexPath.row].scode))"
        cell.lblDept.text = "학과 : \(String(describing: feedItem[indexPath.row].sdept))"
        cell.lblPhone.text = "전화 : \(String(describing: feedItem[indexPath.row].sphone))"
        cell.nameLabel.text = "이름 : \(String(describing: feedItem[indexPath.row].sname))"
        cell.imageView22.image = UIImage(named: "lamp_red.png")
        
        return cell
    }
    
    func getNewsData() {
        guard let url = URL(string: "https://newsdata.io/api/1/news?apikey=pub_51226d8dd8a0cb75639302be1f2459021441&q=cryptocurrency") else { return }
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: url) { [self] data, response, error in
            guard let data = data, error == nil else { return }
            
            let decoder = JSONDecoder()
            
            guard let newsDatas = try? decoder.decode(NewsData.self, from: data) else { return }
            
            self.resultList = newsDatas.results!
            
            filterData = resultList
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }.resume()
        
        
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension TableViewController: QueryModelProtocol{

    func itemDownloaded(items: [DBModel]) {
        feedItem = items
        self.listTableView.reloadData()

    }

}
