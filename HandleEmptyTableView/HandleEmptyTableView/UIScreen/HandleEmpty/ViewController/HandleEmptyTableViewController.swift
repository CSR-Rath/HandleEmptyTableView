//
//  HandleEmptyTableViewController.swift
//  HandleEmptyTableView
//
//  Created by Rath! on 1/5/24.
//

import UIKit

class HandleEmptyTableViewController: UIViewController {
    
    var arrayList = [String]()
    let tableView = UITableView()
    private let refreshControl = UIRefreshControl()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate  = self
        tableView.register(HandleEmptyTableViewCell.self,
                           forCellReuseIdentifier: HandleEmptyTableViewCell.identifier)
        // Set up the refresh control
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)
        view.addSubview(tableView)
    }
    
    @objc private func refresh(_ sender: UIRefreshControl) {
           // Perform the data refresh operation here
       
           // Once the refresh operation is complete, end the refreshing state
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [self] in
               fetchContacts()
               sender.endRefreshing()
           }
       }
    
    func fetchContacts() {
        
        self.arrayList = ["Bill Gates", "Steve Jobs", "Elon Musk", "Alan Turing", "Jeff Bezos", "Larry Page", "Mark Zuckerberg", "Larry Ellison", "Steve Wozniak","Bill Gates", "Steve Jobs", "Elon Musk", "Alan Turing", "Jeff Bezos", "Larry Page", "Mark Zuckerberg", "Larry Ellison", "Steve Wozniak"]
        
        tableView.reloadData()
    }
    
}

extension HandleEmptyTableViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if arrayList.count == 0{
            tableView.setEmptyView(title: "No data found", message: "", messageImage: .swipeRight)
        }else{
            
            tableView.restore()
        }
        
        
        return arrayList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HandleEmptyTableViewCell.identifier, for: indexPath) as! HandleEmptyTableViewCell
        
        cell.lblTitle.text = arrayList[indexPath.row]
        
        return cell
    }
    
}






