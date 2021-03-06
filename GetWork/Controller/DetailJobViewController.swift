//
//  DetailJobViewController.swift
//  GetWork
//
//  Created by Max on 04/12/2019.
//  Copyright © 2019 chulkov. All rights reserved.
//

import UIKit

class DetailJobViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var vacancy = Vacancy(){
        didSet{
            DispatchQueue.main.async {
                //print("reloadData")
                self.tableView.reloadData()
                self.indicator.stopAnimating()
                self.indicator.hidesWhenStopped = true
                self.tableView.isHidden = false
            }
        }
    }
    
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    var vacancyId = String()
    var hideCell = false
    var indicator = UIActivityIndicatorView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 68.0
        tableView.rowHeight = UITableView.automaticDimension
        registerTableViewCells()
        
        //Removing border:
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.layoutIfNeeded()
        self.navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 0.9688121676, green: 0.9688346982, blue: 0.9688225389, alpha: 1)
        
        
        
        
        
        
        
        
        //        //Restoring border:
        //        self.navigationController?.navigationBar.setBackgroundImage(nil, for:.default)
        //        self.navigationController?.navigationBar.shadowImage = nil
        //        self.navigationController?.navigationBar.layoutIfNeeded()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        activityIndicator()
        indicator.startAnimating()
        //indicator.backgroundColor = .g
        tableView.isHidden = true
        NetworkRequest().getVacancy(vacancyId: vacancyId) { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let vacancy):
                //print("vacancy")
                self.vacancy = vacancy
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 2, hideCell{
            return 0.0
        } else {
            return UITableView.automaticDimension
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if vacancy != nil{
            if indexPath.row  == 0 {
                if let cell = tableView.dequeueReusableCell(withIdentifier: "HeadCell") as? HeadCell{
                    cell.backgroundColor = #colorLiteral(red: 0.9688121676, green: 0.9688346982, blue: 0.9688225389, alpha: 1)//navigationController?.navigationBar.backgroundColor
                    cell.cityLabel.text = vacancy?.address?.city
                    cell.vacancyNameLabel.text = vacancy?.name
                    cell.neededExpLabel.text = vacancy?.experience.name
                    cell.employmentLabel.text = vacancy?.employment.name
                    cell.scheduleLabel.text = vacancy?.schedule.name
                    if let salary = vacancy?.salary{
                        cell.salaryLabel.text =  Helper.prepareSalaryLabel(from: salary.from, to: salary.to, currency: salary.currency, gross: salary.gross!)
                    }
                    return cell
                }
                
            } else if indexPath.row == 1 {
                if let cell = tableView.dequeueReusableCell(withIdentifier: "CompanyCell") as? CompanyCell{
                    cell.companyNameLabel.text = vacancy?.employer.name
                    if vacancy?.employer.trusted ?? false {
                        cell.makeTrusted()
                    }
                    return cell
                }
            } else if indexPath.row == 2 {
                //TODO: hide this cell if address is nil
                if let cell = tableView.dequeueReusableCell(withIdentifier: "AdressCell") as? AdressCell{
                    if let address =  vacancy?.address{
                        cell.addressLabel.text = address.raw
                        cell.setMap(lat: address.lat!, long: address.lng!)
                    }else{
                        hideCell = true
                    }
                    
                    return cell
                }
            } else if indexPath.row == 3 {
                if let cell = tableView.dequeueReusableCell(withIdentifier: "DescriptionCell") as? DescriptionCell{
                    cell.descriptionLabel.attributedText = try? NSAttributedString(htmlString: (vacancy?.vacancyDescription)! )
                    
                    return cell
                }
            } else if indexPath.row == 4 {
                if let cell = tableView.dequeueReusableCell(withIdentifier: "ContactsCell") as? ContactsCell{
                    cell.nameLabel.text = vacancy?.contacts?.name
                    cell.emailLabel.text = vacancy?.contacts?.email
                    return cell
                }
            }
            return UITableViewCell()
        }else{
            return UITableViewCell()
        }
        
    }
    
    
    func registerTableViewCells(){
        self.tableView.register(UINib(nibName: "HeadCell", bundle: nil), forCellReuseIdentifier: "HeadCell")
        self.tableView.register(UINib(nibName: "CompanyCell", bundle: nil), forCellReuseIdentifier: "CompanyCell")
        self.tableView.register(UINib(nibName: "AdressCell", bundle: nil), forCellReuseIdentifier: "AdressCell")
        self.tableView.register(UINib(nibName: "DescriptionCell", bundle: nil), forCellReuseIdentifier: "DescriptionCell")
        self.tableView.register(UINib(nibName: "ContactsCell", bundle: nil), forCellReuseIdentifier: "ContactsCell")
    }
    
//    @IBAction func goBack(_ sender: UIBarButtonItem) {
//        //dismiss(animated: true, completion: nil)
//        self.navigationController?.popViewController(animated: true)
//        //navigationController?.popToRootViewController(animated: true)
//    }
//
    func activityIndicator() {
        indicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        indicator.style = UIActivityIndicatorView.Style.gray
        //indicator.color = .red
        indicator.center = self.view.center
        self.view.addSubview(indicator)
    }

    
}
