//
//  DetailJobViewController.swift
//  GetWork
//
//  Created by Max on 04/12/2019.
//  Copyright © 2019 chulkov. All rights reserved.
//

import UIKit

class DetailJobViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
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
        
        //        if let url = URL(string: imageURL!){
        //            DispatchQueue.global().async {
        //                if let data = try? Data(contentsOf: url){
        //                    DispatchQueue.main.async {
        //                        self.logoImage.image = UIImage(data: data)
        //                    }
        //                } //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
        //
        //            }
        //        }
        
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row  == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "HeadCell") as? HeadCell{
                cell.backgroundColor = #colorLiteral(red: 0.9688121676, green: 0.9688346982, blue: 0.9688225389, alpha: 1)//navigationController?.navigationBar.backgroundColor
                return cell
            }
            
        } else if indexPath.row == 1 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "CompanyCell") as? CompanyCell{
                return cell
            }
        } else if indexPath.row == 2 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "AdressCell") as? AdressCell{
                return cell
            }
        } else if indexPath.row == 3 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "DescriptionCell") as? DescriptionCell{
                return cell
            }
        } else if indexPath.row == 4 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "ContactsCell") as? ContactsCell{
                return cell
            }
        }
        
        return UITableViewCell()
    }
    
    func registerTableViewCells(){
        self.tableView.register(UINib(nibName: "HeadCell", bundle: nil), forCellReuseIdentifier: "HeadCell")
        self.tableView.register(UINib(nibName: "CompanyCell", bundle: nil), forCellReuseIdentifier: "CompanyCell")
        self.tableView.register(UINib(nibName: "AdressCell", bundle: nil), forCellReuseIdentifier: "AdressCell")
        self.tableView.register(UINib(nibName: "DescriptionCell", bundle: nil), forCellReuseIdentifier: "DescriptionCell")
        self.tableView.register(UINib(nibName: "ContactsCell", bundle: nil), forCellReuseIdentifier: "ContactsCell")
    }
    
    @IBAction func goBack(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
