//
//  ViewController.swift
//  WebRequestTest
//
//  Created by Matei Suica on 6/20/16.
//  Copyright © 2016 Matei Suica. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var container: UIView!
    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView = WKWebView()
        container.addSubview(webView)

    }
    
    @IBAction func loadSwift(sender: AnyObject) {
        
        
        let urlStr = "http://developer.apple.com"

        loadRequest(urlStr)
    }
    
    @IBAction func loadSteak(sender: AnyObject) {
        
        let urlStr = "http://primecutsblog.com"
        
        loadRequest(urlStr)
    }
    
    
    @IBAction func loadGossip(sender: AnyObject) {
        
        let urlStr = "http://tmz.com"
        
        loadRequest(urlStr)
        
    }
    
    
    func loadRequest(urlStr: String) {
        let url = NSURL(string: urlStr)!
        let request = NSURLRequest(URL: url)
        
        webView.loadRequest(request)
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let frame = CGRectMake(0, 0, container.bounds.width, container.bounds.height)
        webView.frame = frame


    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

