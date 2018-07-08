//
//  ContatoTableViewController.swift
//  TesteiOS
//
//  Created by Bruno Pampolha on 7/7/18.
//  Copyright © 2018 Bruno Pampolha. All rights reserved.
//

import UIKit

class ContatoTableViewController: UITableViewController {
    var cellList: CellList? = CellList()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.fetch()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetch () {
        let url = URL(string: "https://floating-mountain-50292.herokuapp.com/cells.json")
        let task = URLSession.shared.dataTask(with: url!) {(data, response, error) in
            let jsonString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print(jsonString ?? "Erro")
            
            do {
                defer {
                    DispatchQueue.main.sync{
                        self.tableView.reloadData()
                    }
                }
                
                let decoder = JSONDecoder()
                self.cellList = try decoder.decode(CellList.self, from: data!)
            } catch let error {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cellList!.cells.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellModel = self.cellList!.cells[indexPath.row]
        
        switch cellModel.type {
        case 1:
            if let cell: FieldTableViewCell = tableView.dequeueReusableCell(withIdentifier: "FieldTableViewCell", for: indexPath) as? FieldTableViewCell {
                cell.update(cell: cellModel)
                return cell
            }
        case 2:
            if let cell: TextTableViewCell = tableView.dequeueReusableCell(withIdentifier: "TextTableViewCell", for: indexPath) as? TextTableViewCell {
                cell.update(cell: cellModel)
                return cell
            }
        case 4:
            if let cell: CheckboxTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CheckboxTableViewCell", for: indexPath) as? CheckboxTableViewCell {
                cell.update(cell: cellModel)
                return cell
            }
        case 5:
            if let cell: ButtonTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ButtonTableViewCell", for: indexPath) as? ButtonTableViewCell {
                cell.update(cell: cellModel)
                return cell
            }
        default:()
        }
        
        return UITableViewCell()
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
