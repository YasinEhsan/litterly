//
//  EventsViewController.swift
//  litterly
//
//  Created by Joyce Huang on 4/25/19.
//  Copyright © 2019 Joy Paul. All rights reserved.
//

import UIKit

class EventsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    @IBOutlet weak var embeddedTableview: UITableView!
    var data = ["Joyce", "Asif", "Kevin", "Sheng", "Joyce", "Asif", "Kevin", "Sheng"]
    let indentifier = "cellId"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // embeddedTableview.register(EmbeddedTableViewCell.self, forCellReuseIdentifier: indentifier)//
        embeddedTableview.dataSource = self
        embeddedTableview.delegate = self
        embeddedTableview.separatorColor = UIColor.white
       

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - CONSTRAINT SETUP
    
    fileprivate func setupConstraint() {
//        self.embeddedTableview.translatesAutoresizingMaskIntoConstraints = false
        
        
    }
    
    // MARK: - TABLE VIEW DELEGATE & DATASOURCE
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: indentifier, for: indexPath) as! EmbeddedTableViewCell
        
        cell.eventTitle.text = data[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
    
    
}
