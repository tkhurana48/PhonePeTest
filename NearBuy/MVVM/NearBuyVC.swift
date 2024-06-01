//
//  NearBuyVC.swift
//  NearBuy
//
//  Created by Tarun Khurana on 01/06/24.
//

import UIKit
import CoreLocation
class NearBuyVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            let nib = UINib(nibName: "CityTVC", bundle: nil)
            tableView.register(nib, forCellReuseIdentifier: "CityTVC")
        }
    }
    
    @IBOutlet var nodataLbl: UILabel!
    @IBOutlet var slider: UISlider!
    @IBOutlet var loader: UIActivityIndicatorView!
    @IBOutlet var searchBar: UISearchBar!
    var obj = NearBuyViewModel()
    var locationManager = CLLocationManager()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchLocation()
    }

    func fetchLocation(){
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

}

extension NearBuyVC: CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            if let location = locations.last {
                self.obj.lat = location.coordinate.latitude
                self.obj.long = location.coordinate.longitude
                if obj.lat != 0.0 && obj.long != 0.0{
                    locationManager.stopUpdatingLocation()
                    getCityList("")
                }
            }
        }
}

// TABLE VIEW
extension NearBuyVC: UITableViewDelegate,UITableViewDataSource{
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
            let offset = scrollView.contentOffset.y
            let contentHeight = scrollView.contentSize.height
            let height = scrollView.frame.size.height
            
            if offset > contentHeight - height {
                obj.perPage += 10
                getCityList("")
            }
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.obj.nearBuyModel?.venues?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityTVC", for: indexPath) as! CityTVC
        cell.configureCell(self.obj.nearBuyModel?.venues?[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 94
    }
    
    
}

// SEARCH BAR
extension NearBuyVC: UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let searchText = searchBar.text, !searchText.isEmpty else {
            getCityList(searchText)
            return
        }
        searchForText()
    }
     
     func searchForText() {
        let searchText = searchBar.text ?? ""
        
       getCityList(searchText)
    }
}

// API CALL
extension NearBuyVC{
    func getCityList(_ searchName: String){
        self.loader.isHidden = false
        obj.getCitiesList(searchName) {[weak self] (status, msg) in
            if status == .popUp {
                self?.loader.isHidden = true
                return
            }else if status == .proceed{
                if self?.obj.nearBuyModel?.venues?.isEmpty == true{
                    self?.nodataLbl.isHidden = false
                }else{
                    self?.nodataLbl.isHidden = true
                }
                self?.loader.isHidden = true
                self?.tableView.reloadData()
            }
        }
    }
}
