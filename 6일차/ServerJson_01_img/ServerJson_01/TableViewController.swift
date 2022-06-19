//
//  TableViewController.swift
//  ServerJson_01
//
//  Created by TJ on 2022/06/19.
//

import UIKit
import NVActivityIndicatorView


class TableViewController: UITableViewController {
    

    
    @IBOutlet var listTableView: UITableView!
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    var feedItem: [DBModel] = []
    
    override func viewDidLoad() {
      
        print("viewDidLoad()")
        super.viewDidLoad()
        indicator.startAnimating()
        indicator.isHidden = false
        
        print("QueryModel Start")
        
        var queryModel = QueryModel()

        queryModel.delegate = self
        queryModel.downloadItems()
        
        print("QueryModel End")
        
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! MyCell

        cell.lblLabel.text = (feedItem[indexPath.row].title)
        
        let url = URL(string: feedItem[indexPath.row].image)
        let data = try? Data(contentsOf: url!)
        
        cell.imgView.image = UIImage(data: data!)
        
//        cell.textLabel?.text = "학번 : \(feedItem[indexPath.row].scode)"
        return cell
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
        print("이거먼ㄷ")
        feedItem = items
        self.listTableView.reloadData()
        
        indicator.startAnimating()
        indicator.isHidden = true
        
    }
    
}
