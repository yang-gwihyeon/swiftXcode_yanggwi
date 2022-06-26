//
//  TableViewController.swift
//  SimpleTodolist
//
//  Created by TJ on 2022/06/18.
//

import UIKit
import SQLite3

class TableViewController: UITableViewController {
    
    var db: OpaquePointer?
    
    @IBOutlet var tvListView: UITableView!
    
    var dataArray: [Todolist] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        dataInit()
   
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        // SQLite 생성하기
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("TodolistData.sqlite")
        
//        sqlite3_open(fileURL.path, &db)
        
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK{
            print("error opening database")
        }
        
        
        
        if sqlite3_exec(db, "CREATE TABLE IF NOT EXISTS todolist (tid INTEGER PRIMARY KEY AUTOINCREMENT, tcontent TEXT)", nil, nil, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db))
            print("error creating table: \(errmsg)")
      
        }
        
//        tempInsert()
        readValues()
        
        
        
        
    }

    // MARK: - Table view data source
    
//    func dataInit(){
//        dataArray.append("꽃선물 준비")
//        dataArray.append("공기 청정기 필터 교환")
//        dataArray.append("꽃선물 준비")
//    }
    
    func tempInsert(){
        var stmt: OpaquePointer?
        let SQLITE_TRANSIENT = unsafeBitCast(-1, to: sqlite3_destructor_type.self)
        
        let queryString = "INSERT INTO todolist (tcontent) VALUES (?)"
        sqlite3_prepare(db, queryString, -1, &stmt, nil)
        
        //에러버전
//        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
//            let errmsg = String(cString: sqlite3_errmsg(db)!)
//            print("error preparing insert: \(errmsg)")
//            return
//        }
        
        sqlite3_bind_text(stmt, 1, "치과가기", -1, SQLITE_TRANSIENT)
        sqlite3_step(stmt)
        
//        if sqlite3_step(stmt) != SQLITE_DONE{
//            let errmsg = String(cString: sqlite3_errmsg(db)!)
//            print("failuer inserting \(errmsg)")
//            return
//        }
        
        print("Student saved successfully!")
    }
    
    func readValues(){
        dataArray.removeAll()
        
        let queryString = "SELECT * FROM todolist"
        var stmt: OpaquePointer?
        
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing select: \(errmsg)")
            return
        }
        
        while sqlite3_step(stmt) == SQLITE_ROW{
            let id = sqlite3_column_int(stmt,0)
            let content = String(cString: sqlite3_column_text(stmt, 1))
            
            print(id,content)
    
            dataArray.append(Todolist(id: Int(id), content: content))
        
        }
        
        
        self.tvListView.reloadData()
    
    }
    
    
    

    @IBAction func addList(_ sender: UIBarButtonItem) {
        let addAlert = UIAlertController(title: "Todo List", message: "추가할 내용을 입력하세요", preferredStyle: .alert)

        addAlert.addTextField{ACTION in ACTION.placeholder = "내용 입력"}



        let cancelAction = UIAlertAction(title: "취소", style: .default, handler: nil)

        let okAction = UIAlertAction(title: "추가", style: .default, handler: {ACTION in
            self.insert(addAlert.textFields![0].text!)

        })

        addAlert.addAction(cancelAction)
        addAlert.addAction(okAction)

        present(addAlert, animated: true, completion: nil)
        
        
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        cell.textLabel?.text = dataArray[indexPath.row].content

        // Configure the cell...

        return cell
    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let id = dataArray[indexPath.row].id
            deleteAction(id: id)
            readValues()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    func insert(_ content: String) {
    
        var stmt: OpaquePointer?
        let SQLITE_TRANSIENT = unsafeBitCast(-1, to: sqlite3_destructor_type.self)
        
        let queryString = "INSERT INTO todolist (tcontent) VALUES (?)"
        sqlite3_prepare(db, queryString, -1, &stmt, nil)
        
        //에러버전
//        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
//            let errmsg = String(cString: sqlite3_errmsg(db)!)
//            print("error preparing insert: \(errmsg)")
//            return
//        }
        //addAlert.textFields![0].text!
        sqlite3_bind_text(stmt, 1, content, -1, SQLITE_TRANSIENT)
        sqlite3_step(stmt)
        
//        if sqlite3_step(stmt) != SQLITE_DONE{
//            let errmsg = String(cString: sqlite3_errmsg(db)!)
//            print("failuer inserting \(errmsg)")
//            return
//        }
        
        print("Student saved successfully!")
        
        readValues()
    }
    
    func deleteAction(id: Int){
        var stmt: OpaquePointer?
        let queryString = "DELETE FROM todolist WHERE tid = ?"
        
        sqlite3_prepare(db, queryString, -1, &stmt, nil)
        sqlite3_bind_int(stmt, 1, Int32(id))
        sqlite3_step(stmt)
        
    }
    

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
