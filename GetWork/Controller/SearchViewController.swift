//
//  ViewController.swift
//  GetWork
//
//  Created by Max on 02/12/2019.
//  Copyright © 2019 chulkov. All rights reserved.
//

import UIKit



class SearchViewController: UIViewController, UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate{
    
    var jobs = [Job](){
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    @IBOutlet weak var settingsButton: UIButton! {
        didSet{
            settingsButton.layer.cornerRadius = 8
            settingsButton.layer.borderWidth = 1
            settingsButton.layer.borderColor = #colorLiteral(red: 0.9499533772, green: 0.9500743747, blue: 0.9531216025, alpha: 1)
        }
       
    }
    @IBOutlet weak var searchBar: UISearchBar! {
        didSet{
            searchBar.delegate = self
        }
    }
    @IBOutlet weak var tableView: UITableView! {
        didSet{
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       // getData(text: "")
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("searchBarTextDidEndEditing     -     \(searchBar.text ?? "empty")")
        if let text = searchBar.text{
            //getData(text: text)
            
            let jobRequest = NetworkRequest(text: text, page: 0)
            jobRequest.getJobs(compleation: { [weak self] result in
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let jobs):
                    self?.jobs = jobs
                }
            })
            
            
        }
        
    }

//    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
//        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
//    }
    
    
    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jobs.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "JobCell", for: indexPath)
        
        
//        if let url = jobs[indexPath.row].companyLogo {
//            getData(from: URL(string: url)!) { data, response, error in
//                guard let data = data, error == nil else { return }
//                DispatchQueue.main.async() {
//                    cell.imageView?.image = UIImage(data: data)
//                }
//            }
//        }
//        
        
        cell.textLabel?.text = jobs[indexPath.row].title
        
        return cell
    }
}

