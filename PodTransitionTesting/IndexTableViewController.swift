//
//  IndexTableViewController.swift
//  PodTransitionTesting
//
//  Created by Louis Tur on 1/10/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit

protocol IndexTableTitled {
  var cellTitle: String { get }
}

class IndexTableViewController: UITableViewController {
  
  let vcDirectory: [IndexTableTitled] = [ ViewController(), CompactCardViewController() ]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "default")
  }
  
  // MARK: - Table view data source
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.vcDirectory.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "default", for: indexPath)
    cell.textLabel?.text = vcDirectory[indexPath.row].cellTitle
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    guard let dtvc = vcDirectory[indexPath.row] as? UIViewController else {
      return
    }
    
    self.navigationController?.pushViewController(dtvc, animated: true)
//    self.navigationController?.heroReplaceViewController(with: dtvc)
  }
  
}
