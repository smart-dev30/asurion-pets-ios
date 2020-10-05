//
//  PetDetailViewController.swift
//  AsurionPets
//
//  Created by Akio on 10/6/20.
//  Copyright © 2020 Akio. All rights reserved.
//

import UIKit
import WebKit

class PetDetailViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    var pet: Pet? = nil
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if pet != nil {
            let link = URL(string: pet!.content_url)!
            let request = URLRequest(url: link)
            webView.navigationDelegate = self
            webView.load(request)
        
            loader.isHidden = false
            loader.startAnimating()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        // Check UI updates
        
    }
    
    // MARK: - WebView delegates
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        loader.stopAnimating()
        loader.isHidden = true
    }
    
}
