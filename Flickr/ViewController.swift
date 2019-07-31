//
//  ViewController.swift
//  Flickr
//
//  Created by Александр on 21/06/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let tableView = UITableView()
    private var dataArray = NSArray()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        
        DataLayer.getImages { (array) in
            self.dataArray = array
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    func setupTableView() {
        self.tableView.frame = self.view.frame
        self.view.addSubview(self.tableView)
        self.tableView.register(TableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView.rowHeight = 500
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let model = self.dataArray[indexPath.row] as! Model
        
        cell.configureCell(model: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let nextVC = ViewController2()
//        let model = NotesArray.shareInstance.getNotes(index: indexPath.row)
//        nextVC.model = model
//        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}
