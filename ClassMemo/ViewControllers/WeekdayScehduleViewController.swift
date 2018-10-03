//
//  WeekdayScehduleViewController.swift
//  ClassMemo
//
//  Created by Anthony Lee on 10/1/18.
//  Copyright © 2018 anthony. All rights reserved.
//

import UIKit
import CoreData

class WeekdayScehduleViewController: UIViewController {

    var classes = [Classes]()
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchClasses()
        setupTableView()
    }
    
    @IBAction func addClass(){
        let alert = UIAlertController(title: "Add Class", message: nil, preferredStyle: .alert)
        alert.addTextField { (texField) in
            texField.placeholder = "Class"
        }
        
        let action = UIAlertAction(title: "Add Person", style: .default) { (_) in
            let className = alert.textFields!.first!.text!
            
            //Create Classes Object
            let class1 = Classes(context: PersistenceService.context)
            class1.name = className
            
            //CoreData Saving
            PersistenceService.saveContext()
            
            //Add class to the classes array
            self.classes.append(class1)
            
            //Reload TableView Data
            self.tableView.reloadData()
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - Fetch Classes from Core Data Stack
    private func fetchClasses(){
        let fetchRequest : NSFetchRequest<Classes> = Classes.fetchRequest()
        do{
            let classes = try PersistenceService.context.fetch(fetchRequest)
            self.classes = classes
        } catch {
            //When we fail to fetch Classes from the Core Data Stack
            
        }
    }
}

extension WeekdayScehduleViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return classes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ClassTableViewCell", for: indexPath) as! ClassTableViewCell
        
        //Get values from the classes array
        cell.textLabel?.text = classes[indexPath.row].name
        cell.classImageView?.layer.cornerRadius = 50
        return cell
    }
    
    //Setup tableView
    func setupTableView(){
        self.tableView.rowHeight = 200
    }
}
