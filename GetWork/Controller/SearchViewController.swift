//
//  ViewController.swift
//  GetWork
//
//  Created by Max on 02/12/2019.
//  Copyright © 2019 chulkov. All rights reserved.
//

import UIKit



class SearchViewController: UIViewController, UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate{
    
    var jobs = Job(){
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
    
    var fetchingMore = false
    var currentPage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //navigationController?.hidesBarsOnSwipe = true
        tableView.estimatedRowHeight = 68.0
        tableView.rowHeight = UITableView.automaticDimension
        registerTableViewCells()
        
        NetworkRequest().getJobs { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let jobs):
                self.jobs = jobs
            }
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tabBarController?.tabBar.isHidden = false
    }
//    //MARK: To hide navigation bar on scroll
//    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
//
//        if(velocity.y>0) {
//            //Code will work without the animation block.I am using animation block incase if you want to set any delay to it.
//            UIView.animate(withDuration: 2.5, delay: 0, options: UIView.AnimationOptions(), animations: {
//                self.navigationController?.setNavigationBarHidden(true, animated: true)
//                self.navigationController?.setToolbarHidden(true, animated: true)
//                //print("Hide")
//            }, completion: nil)
//
//        } else {
//            UIView.animate(withDuration: 2.5, delay: 0, options: UIView.AnimationOptions(), animations: {
//                self.navigationController?.setNavigationBarHidden(false, animated: true)
//                self.navigationController?.setToolbarHidden(false, animated: true)
//                //print("Unhide")
//            }, completion: nil)
//        }
//    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("searchBarTextDidEndEditing     -     \(searchBar.text ?? "empty")")
        if let text = searchBar.text{
            //getData(text: text)
            currentPage = 0
            NetworkRequest().getJobsWithSearch(text: text, page: 0) { result in
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let jobs):
                    self.jobs = jobs
                }
            }
            
        }
        
    }
    
    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jobs?.items.count ?? 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "JobTableViewCell") as? JobTableViewCell{
            cell.titleLabel.text = jobs?.items[indexPath.row].name
            cell.companyLabel.text = jobs?.items[indexPath.row].employer?.name
            cell.cityLabel.text = jobs?.items[indexPath.row].address?.city
            if let salary = jobs?.items[indexPath.row].salary{
                cell.salaryLabel.text = Helper.prepareSalaryLabel(from: salary.from, to: salary.to, currency: salary.currency, gross: salary.gross!)
                cell.cityLeadingConstraint.constant = 10
            }else{
                cell.cityLeadingConstraint.constant = 0
            }
            //TODO: Что то не то ^^^
            
            cell.descriptionLabel.text = jobs?.items[indexPath.row].snippet.requirement
            if let responsibility = jobs?.items[indexPath.row].snippet.responsibility{
                cell.descriptionLabel.text?.append(responsibility)
            }
            
            cell.setDate(date: jobs?.items[indexPath.row].publishedAt ?? "2019-11-25T09:59:39+0300")
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func registerTableViewCells(){
        let customCell = UINib(nibName: "JobTableViewCell", bundle: nil)
        self.tableView.register(customCell, forCellReuseIdentifier: "JobTableViewCell")
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        
        if offsetY > contentHeight - scrollView.frame.height {
            
            if !fetchingMore{
                if let text = searchBar.text{
                    beginBatchFetch(text: text, page: currentPage)
                }else{
                    print("searchbar text is empty somehow")
                }
                
            }
        }
    }
    
    func beginBatchFetch(text: String, page: Int){
        fetchingMore = true
        
        //        NetworkRequest(text: text, page: page).getJobs(compleation: { [weak self] result in
        //
        //            switch result {
        //            case .failure(let error):
        //                print(error)
        //            case .success(let jobs):
        //                self?.fetchingMore = false
        //                if jobs.isEmpty == false{
        //                    self?.jobs.append(contentsOf: jobs)
        //                    self?.currentPage += 1
        //                }else{
        //                    print("No more jobs for you")
        //
        //                }
        //
        //            }
        //        })
        
        //        NetworkRequest().getJobsWithSearch(text: text, page: page) { result in
        //            switch result {
        //            case .failure(let error):
        //                print(error)
        //            case .success(let jobs):
        //                self.fetchingMore = false
        //                if jobs.isEmpty == false{
        //                    self.jobs.append(contentsOf: jobs)
        //                    self.currentPage += 1
        //                }else{
        //                    print("No more jobs for you")
        //
        //                }
        //            }
        //        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetailedJobSegue", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailedJobSegue" {
            if segue.destination.isKind(of: DetailJobViewController.self) {
                let secondVC = segue.destination as! DetailJobViewController
                let blogIndex = tableView.indexPathForSelectedRow?.row
                if let vacancyId = jobs?.items[blogIndex!].id{
                    secondVC.vacancyId = vacancyId
                }
            }
        }
    }
}

