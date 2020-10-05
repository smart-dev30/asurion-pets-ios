//
//  ViewController.swift
//  AsurionPets
//
//  Created by Akio on 10/5/20.
//  Copyright © 2020 Akio. All rights reserved.
//

import UIKit

class PetListController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var petList: UITableView!

    @IBOutlet weak var buttonChat: UIButton!
    @IBOutlet weak var buttonCall: UIButton!
    @IBOutlet weak var buttonStacks: UIStackView!

    @IBOutlet weak var textOfficialHours: UILabel!
    @IBOutlet weak var viewOfficialHours: UIView!

    @IBOutlet weak var indicator: UIActivityIndicatorView!

    var pets = [Pet]()
    
    let client = HttpClient(
        baseURL: URL(string: "https://asurion.herokuapp.com")!
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Check UI updates
        indicator.startAnimating()
        updateSettings(nil)
        
        // Invoke load settings and pets from heroku server
        getSettings()
        getPets()
    }
    
    // MARK: - UI updates
    func updateSettings(_ settings: Settings?) {
        if settings != nil {
            textOfficialHours.text = "Office Hours: \(settings!.workHours)"
            buttonChat.isHidden = !settings!.isChatEnabled
            buttonCall.isHidden = !settings!.isCallEnabled
            
            buttonChat.isEnabled = true
            buttonCall.isEnabled = true
        } else {
            textOfficialHours.text = "Please wait..."
            buttonChat.isEnabled = false
            buttonCall.isEnabled = false
            
            viewOfficialHours.addViewBorder(
                borderColor: #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1),
                borderWidth: 2.0,
                borderCornerRadius: 10
            )
        }
    }
    
    // MARK: - Load data(Settings, Pets) from server
    func getSettings() {
        client.fetch(API.getSettings()) { (result) in
            switch result {
            case .success(let resSettings, let response):
                self.updateSettings(resSettings)
                print(response)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getPets() {
        client.fetch(API.Pets.all()) { (result) in
            switch result {
            case .success(let resPets, let response):
                self.pets = resPets
                self.petList.reloadData()
                print(response)
            case .failure(let error):
                print(error)
            }
            
            // Stop Activity Indicator's animation and go away!!!
            self.indicator.startAnimating()
            self.indicator.isHidden = true
        }
    }

    // MARK: - Table View delegates
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pets.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PetTableViewCell") as! PetTableViewCell
        
        let pet = pets[indexPath.row]
        
        cell.imgView.downloaded(from: pet.image_url)
        cell.txtLabel.text = pet.title

        return cell
    }
}

