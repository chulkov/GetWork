//
//  DetailJobViewController.swift
//  GetWork
//
//  Created by Max on 04/12/2019.
//  Copyright © 2019 chulkov. All rights reserved.
//

import UIKit

class DetailJobViewController: UIViewController {

    @IBOutlet weak var logoImage: UIImageView!
    
    var imageURL: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let url = URL(string: imageURL!)

        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url!){
                DispatchQueue.main.async {
                    self.logoImage.image = UIImage(data: data)
                }
            } //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch

        }
    }
    
    override func viewWillLayoutSubviews() {
//        if let image = imageURL{
//            print("imageurl \(image)")
//        }else{
//            print("wtf")
//        }
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
