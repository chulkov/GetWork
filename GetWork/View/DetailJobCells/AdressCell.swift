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

    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    fileprivate let locationManager: CLLocationManager = CLLocationManager()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

        
    }

    func setMap(lat: CLLocationDegrees, long: CLLocationDegrees){
        mapView.mapType = MKMapType.standard
        // 2)
        let location = CLLocationCoordinate2D(latitude: lat, longitude: long)
        // 3)
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
