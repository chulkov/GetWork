//
//  AdressCell.swift
//  GetWork
//
//  Created by Max on 10/12/2019.
//  Copyright © 2019 chulkov. All rights reserved.
//

import UIKit
import MapKit

class AdressCell: UITableViewCell {

    @IBOutlet weak var mapView: MKMapView!
    fileprivate let locationManager: CLLocationManager = CLLocationManager()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        mapView.mapType = MKMapType.standard
        // 2)
        let location = CLLocationCoordinate2D(latitude: 23.0225,longitude: 72.5714)
        // 3)
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
