//
//  SearchSettingsViewController.swift
//  GetWork
//
//  Created by Max on 03/12/2019.
//  Copyright © 2019 chulkov. All rights reserved.
//

import UIKit

class SearchSettingsViewController: UITableViewController {

    //1 segment
    @IBOutlet weak var vacancyTextField: UITextField!
    @IBOutlet weak var companyTextField: UITextField!
    @IBOutlet weak var regionTextField: UITextField!
    @IBOutlet weak var salaryTextField: UITextField!
    //5 segment
    
    @IBOutlet weak var noAgencyFlag: UISwitch!
    @IBOutlet weak var forDisablesFlag: UISwitch!
    @IBOutlet weak var showSalaryFlag: UISwitch!
    @IBOutlet weak var forTeensFlag: UISwitch!
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setButton()
        self.tabBarController?.tabBar.isHidden = true
    }
    
    @objc func buttonAction(sender: UIButton!) {
        if let viewWithTag = self.navigationController?.view.viewWithTag(100) {
            viewWithTag.removeFromSuperview()
        }
        performSegue(withIdentifier: "showResult", sender: nil)
        
        print("Button tapped")
    }
    
    
    @IBAction func switchChanged(_ sender: UISwitch) {
        switch sender.tag {
        case 0:
            print("noAgencyFlag" ,noAgencyFlag.isOn)
        case 1:
            print("forDisablesFlag" ,forDisablesFlag.isOn)
        case 2:
            print("showSalaryFlagChanged" , showSalaryFlag.isOn)
        default:
            print("error")
        }
    }


    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print(noAgencyFlag.isOn)
        print(forDisablesFlag.isOn)
        print(showSalaryFlag.isOn)
        print(forTeensFlag.isOn)
        
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return 15
        }else{
            return 50.0
        }
    }
    
//    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
//        (view as! UITableViewHeaderFooterView).contentView.backgroundColor = UIColor.black.withAlphaComponent(0.4)
//        (view as! UITableViewHeaderFooterView).textLabel?.textColor = UIColor.white
//
//    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UILabel(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: self.view.frame.width, height: 50)))
        headerView.backgroundColor = #colorLiteral(red: 0.9495434077, green: 0.9495434077, blue: 0.9495434077, alpha: 0.6923961901)
        let label = UILabel(frame: CGRect(x: 15, y: 20, width: self.view.frame.width, height: 30))
        
        switch section{
        case 1:
            label.text = "ПРОФЕССИОНАЛЬНАЯ ОБЛАСТЬ"
        case 2:
            label.text = "ОТРАСЛЬ КОМПАНИИ"
        case 3:
            label.text = "ТРЕБОВАНИЯ"
        case 4:
            label.text = "ПОКАЗЫВАТЬ"
        default:
            label.text = ""
        }
        //label.text = "Some Text"
        label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        headerView.addSubview(label)
        return headerView
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    fileprivate func setButton() {
        let findJobButton = UIButton(frame: CGRect(x: 100, y: 500, width: 100, height: 100))
        findJobButton.backgroundColor = #colorLiteral(red: 0.08863712102, green: 0.4547017249, blue: 0.8938081861, alpha: 1)
        findJobButton.setTitle("Найти работу", for: .normal)
        findJobButton.tag = 100
        findJobButton.titleLabel?.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        //findJobButton.backgroundColor = .clear // #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0.5982983733)
        findJobButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        findJobButton.layer.cornerRadius = 5
        findJobButton.layer.borderWidth = 1
        findJobButton.layer.borderColor = #colorLiteral(red: 0.08863712102, green: 0.4547017249, blue: 0.8938081861, alpha: 1)//UIColor.black.cgColor
        self.navigationController?.view.addSubview(findJobButton)
        
        findJobButton.translatesAutoresizingMaskIntoConstraints = false
        findJobButton.centerXAnchor.constraint(equalTo: (self.navigationController?.view.centerXAnchor)!).isActive = true
        findJobButton.widthAnchor.constraint(equalToConstant: self.view.frame.width - 20).isActive = true
        //        findJobButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        findJobButton.bottomAnchor.constraint(equalTo:  (self.navigationController?.view.bottomAnchor)!, constant: -20).isActive = true
    }
}
