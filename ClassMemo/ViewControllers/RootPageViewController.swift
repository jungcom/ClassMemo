//
//  RootPageViewController.swift
//  ClassMemo
//
//  Created by Anthony Lee on 10/1/18.
//  Copyright © 2018 anthony. All rights reserved.
//

import UIKit

class RootPageViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    var classes = [String]()
    
    lazy var viewControllerList:[UIViewController] = {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        
        //setup for Monday Schedule
        let vc1 = sb.instantiateViewController(withIdentifier: "Monday") as! WeekdayScehduleViewController
        
        //setup for Tuesday Schedule
        let vc2 = sb.instantiateViewController(withIdentifier: "Monday") as! WeekdayScehduleViewController
        
        //setup for Wednesday Schedule
        let vc3 = sb.instantiateViewController(withIdentifier: "Monday") as! WeekdayScehduleViewController
        
        //setup for Thursday Schedule
        let vc4 = sb.instantiateViewController(withIdentifier: "Monday") as! WeekdayScehduleViewController
        
        //setup for Friday Schedule
        let vc5 = sb.instantiateViewController(withIdentifier: "Monday") as! WeekdayScehduleViewController
        
        return [vc1,vc2,vc3,vc4,vc5]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set datasource
        self.dataSource = self
        // Do any additional setup after loading the view.
        if let firstViewController = viewControllerList.first{
            self.setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let vcIndex = viewControllerList.index(of: viewController) else {return nil}
        
        let previousIndex = vcIndex - 1
        
        guard previousIndex >= 0 else{return nil}
        
        guard viewControllerList.count > previousIndex else {return nil}
        
        return viewControllerList[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let vcIndex = viewControllerList.index(of: viewController) else {return nil}
        
        let afterIndex = vcIndex + 1
        
        guard afterIndex != viewControllerList.count else {return nil}
        
        guard viewControllerList.count > afterIndex else {return nil}
        
        return viewControllerList[afterIndex]
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension RootPageViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return classes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = ""
        return cell
    }
}
