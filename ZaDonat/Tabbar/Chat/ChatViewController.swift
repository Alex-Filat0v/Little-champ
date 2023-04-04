//
//  ChatViewController.swift
//  ZaDonat
//
//  Created by MacUniverse on 26.03.2023.
//

import UIKit

class ChatViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var table: UITableView!
    
    var users: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 1...2
        {
            APIManager.shared.getUser(id: "user\(i)", imageID: "\(i)") {res in
                self.users.append(res!)
                print("user\(i)")
                DispatchQueue.main.async {
                    self.table.reloadData()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ChatTableViewCell
        cell.personName.text = users[indexPath.row].user_name
        cell.personImage.image = users[indexPath.row].image
        return cell
    }

}
