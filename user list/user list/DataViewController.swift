//
//  DataViewController.swift
//  user list
//
//  Created by brn.developers on 6/26/18.
//  Copyright © 2018 brn.developers. All rights reserved.
//

import UIKit

let sampleDataAddress = "https://jsonplaceholder.typicode.com/users"
let url = URL(string: sampleDataAddress)!
let jsonData = try! Data(contentsOf: url)
struct User: Codable {
    let name: String
    let email: String
    let address: Address
    struct Address: Codable {
        let street: String
        let suite: String
        let city: String
        let zipcode: String
        let geo: Coordinates
        struct Coordinates: Codable {
            let lat: Double
            let lng: Double
            init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                let latString = try values.decode(String.self, forKey: .lat)
                let lngString = try values.decode(String.self, forKey: .lng)
                lat = Double(latString) ?? 0
                lng = Double(lngString) ?? 0
            }
        }
    }
    
}

class DataViewController: UITableViewController {
    
    var userData = [User]()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonDecoder = JSONDecoder()
        do
        {
        self.userData = try jsonDecoder.decode([User].self, from: jsonData)
        print(self.userData.count)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
        catch
        {
            print(error)
        }
        
     
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return userData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.nameLabel?.text = "Name: "+userData[indexPath.row].name
        cell.emailLabel?.text = "Email: "+userData[indexPath.row].email
        let addressString = """
                           street:\(userData[indexPath.row].address.street)
                           suite:\(userData[indexPath.row].address.suite)
                           city:\(userData[indexPath.row].address.city)
                           zipcode:\(userData[indexPath.row].address.zipcode)
                           """
        cell.addressLabel?.text = "Address:\n"+addressString
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 248
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "MapView") as! ViewController
          vc.latitude=userData[indexPath.row].address.geo.lat
          vc.longitude=userData[indexPath.row].address.geo.lng
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    
    
    
    
    
    
    
    

}
