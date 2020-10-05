//
//  ViewController.swift
//  AsurionPets
//
//  Created by Akio on 10/5/20.
//  Copyright © 2020 Akio. All rights reserved.
//

import UIKit

class PetListController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var buttonChat: UIButton!
    @IBOutlet weak var buttonCall: UIButton!
    @IBOutlet weak var buttonStacks: UIStackView!
    @IBOutlet weak var textOfficialHours: UILabel!
    @IBOutlet weak var viewOfficialHours: UIView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    var settings: Settings? = nil
    var pets = [Pet]()
    
    let client = HttpClient(
        baseURL: URL(string: "https://asurion.herokuapp.com")!   // Set custom base URL.
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        getSettings()
        getPets()
    }
    
    // MARK: - Load data(Settings, Pets) from server
    func getSettings() -> Void {
        client.fetch(API.getSettings()) { (result) in
            switch result {
            case .success(let resSettings, let response):
                self.settings = resSettings
                print(response)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getPets() -> Void {
        client.fetch(API.Pets.all()) { (result) in
            switch result {
            case .success(let resPets, let response):
                self.pets = resPets
                print(response)
            case .failure(let error):
                print(error)
            }
        }
    }

    // MARK: - Table View delegates
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pets.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PetTableViewCell") as! PetTableViewCell
        
        let petData = pets[indexPath.row]
        
        cell.imgView.downloaded(from: petData.image_url)
        cell.txtLabel.text = petData.title

        return cell
    }
}

