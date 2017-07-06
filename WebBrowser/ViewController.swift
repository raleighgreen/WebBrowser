//
//  ViewController.swift
//  WebBrowser
//
//  Created by Raleigh Green on 6/29/17.
//  Copyright © 2017 Raleigh Green. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var webAddress: UITextField!
    @IBOutlet var webView: UIWebView!
    
    var address: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.scalesPageToFit = true
    }
    
    @IBAction func goPressed(_ sender: UIButton) {
        webAddress.resignFirstResponder()
        loadWebPage()
    }
    @IBAction func leftPressed(_ sender: UIBarButtonItem) {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    @IBAction func rightPressed(_ sender: UIBarButtonItem) {
        if webView.canGoForward {
            webView.goForward()
        }
    }
    @IBAction func zoomOut(_ sender: UIBarButtonItem) {
        webView.scrollView.zoomScale -= 0.1
    }
    @IBAction func zoomIn(_ sender: UIBarButtonItem) {
        webView.scrollView.zoomScale += 0.1
    }
    
    func loadWebPage() {
        
        if webAddress.text != "" {
            address = webAddress.text!
            if address.hasPrefix("www.") {
                address = "http://" + address
            } else if !address.hasPrefix("http://") || !address.hasPrefix("https://") {
                address = "http://" + address
            }
            
            // url can be constructed with a string
            let url = URL(string: address)
            // url request will need a url
            let request = URLRequest(url: url!)
            // web view will load page by giving it a url request
            webView.loadRequest(request)
            
            
        }
        
        
        
    }

}

