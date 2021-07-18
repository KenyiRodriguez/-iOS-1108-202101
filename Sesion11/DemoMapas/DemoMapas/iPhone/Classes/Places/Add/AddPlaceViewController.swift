//
//  AddPlaceViewController.swift
//  DemoMapas
//
//  Created by Kenyi Rodriguez on 21/06/21.
//

import UIKit
import GoogleMaps

protocol AddPlaceViewControllerDelegate {
    func addPlaceViewController(_ controller: AddPlaceViewController, addNewPlace place: PlaceBE)
}

class AddPlaceViewController: UIViewController {
    
    @IBOutlet weak var txtAddress   : UITextField!
    @IBOutlet weak var txtDistrict  : UITextField!
    @IBOutlet weak var mapView      : GMSMapView!
    
    var delegate: AddPlaceViewControllerDelegate?
    private var coordinateSelected: CLLocationCoordinate2D?
    
    lazy var marker: GMSMarker = {
       
        let marker = GMSMarker()
        marker.icon = UIImage(named: "pin")
        marker.map = self.mapView
        return marker
    }()
    
    lazy private var locationManager: CLLocationManager = {
        let manager = CLLocationManager()
        manager.requestWhenInUseAuthorization()
        manager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        manager.distanceFilter = 100
        return manager
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupGPS()
        self.setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let userCoordinate = self.locationManager.location?.coordinate {
            self.moveCameraToCoordinate(userCoordinate, zoom: 17)
        }
    }
    
    @IBAction func clickBtnSave(_ sender: Any) {
        
        guard let district = self.txtDistrict.text, district.count != 0  else {
            self.showAutomaticAlert(title: "Error", message: "Ingresa un distrito!!")
            return
        }
        
        guard let address = self.txtAddress.text, address.count != 0  else {
            self.showAutomaticAlert(title: "Error", message: "Ingresa una dirección")
            return
        }
        
        guard let coordinate = self.coordinateSelected else {
            self.showAutomaticAlert(title: "Error", message: "Seleccione una ubicación en el mapa.")
            return
        }
        
        let objPlace = PlaceBE(direccion: address, distrito: district, coordinate: coordinate)
        
        //COMENTARIO: Aca decides si lo envias por un servicio, lo guardas en una base de datos local, o lo pasas a una lista temporal.
        
        self.delegate?.addPlaceViewController(self, addNewPlace: objPlace)
        self.navigationController?.popViewController(animated: true)
    }
    
    private func setupView() {
        
        self.mapView.layer.borderWidth = 1
        self.mapView.layer.borderColor = UIColor.lightGray.cgColor
        self.mapView.layer.cornerRadius = 8
    }
    
    private func setupGPS() {
        
        self.locationManager.startUpdatingLocation()
        self.mapView.settings.compassButton = true
        self.mapView.settings.myLocationButton = true
        self.mapView.isMyLocationEnabled = true
    }
        
    private func moveCameraToCoordinate(_ coordinate: CLLocationCoordinate2D, zoom: Float) {
        
        let camera = GMSCameraPosition(target: coordinate, zoom: zoom)
        self.mapView.animate(to: camera)
    }
}

extension AddPlaceViewController: GMSMapViewDelegate {
    
    func mapView(_ mapView: GMSMapView, didLongPressAt coordinate: CLLocationCoordinate2D) {
        
        self.coordinateSelected = coordinate
        self.marker.position = coordinate
    }
}
