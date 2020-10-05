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
    
    var petArray = [Pet]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        indicator.isHidden = true
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PetTableViewCell") as! PetTableViewCell
        
        let petData = petArray[indexPath.row]
        
        cell.imgView.downloaded(from: petData.image_url)
        cell.txtLabel.text = petData.title

        return cell
    }
}

