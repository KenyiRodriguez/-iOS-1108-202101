//
//  ListPlaceViewController.swift
//  DemoMapas
//
//  Created by Kenyi Rodriguez on 14/06/21.
//

import UIKit
import CoreLocation

class ListPlaceViewController: UIViewController {
    
    @IBOutlet weak var tlbPlaces: UITableView!
    
    var arrayPlaces = [PlaceBE]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrayPlaces.append(PlaceBE(direccion: "Av. Alfredo Benavides 778, Cercado de Lima 15074",
                                   distrito: "Miraflores",
                                   coordinate: CLLocationCoordinate2D(latitude: -12.125431214072368, longitude: -77.0248591001233)))
        
        arrayPlaces.append(PlaceBE(direccion: "Av. Faustino Sánchez Carrión 285, San Isidro 15076",
                                   distrito: "San Isidro",
                                   coordinate: CLLocationCoordinate2D(latitude: -12.093836452260742, longitude: -77.05300107053482)))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.reloadInfo()
    }
    
    func reloadInfo() {
        
        //Llamar a firebase
        //Al terminar en el callback haver un reload a la tabla
        self.tlbPlaces.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let controller = segue.destination as? PlaceDetailViewController, let objPlace = sender as? PlaceBE {
            controller.objPlace = objPlace
            
        } else if let controller = segue.destination as? AddPlaceViewController {
            controller.delegate = self
        }
    }
}

extension ListPlaceViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.arrayPlaces.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlaceTableViewCell", for: indexPath) as? PlaceTableViewCell
        cell?.objPlace = self.arrayPlaces[indexPath.row]
        
        return cell ?? UITableViewCell()
    }
}

extension ListPlaceViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let objPlace = self.arrayPlaces[indexPath.row]
        self.performSegue(withIdentifier: "PlaceDetailViewController", sender: objPlace)
    }
}

extension ListPlaceViewController: AddPlaceViewControllerDelegate {
    
    func addPlaceViewController(_ controller: AddPlaceViewController, addNewPlace place: PlaceBE) {
        self.arrayPlaces.append(place)
    }
}
