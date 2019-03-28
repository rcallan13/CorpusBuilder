//
//  ViewController.swift
//  CorpusBuilder
//
//  Created by Ron Allan on 2019-03-25.
//  Copyright © 2019 RCAL Software Solutions. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, AutoSearchDelegate {

    static var section: Int = -1
    static var index: Int = -1
    var autoSearchManager: AutoSearchManager?
    var searchResults: Dictionary<String, [SearchModel]?>?
    
    @IBOutlet weak var scrollView: NSScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initSearch()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    func onSearchResults(_ searchResults: [NlpResult]?) {
        
        var resultsStr = String()
        /*
         guard let _ = searchResults, let _ = searchResults?[0].searchPath else {
         activityIndicator.stopAnimating()
         return
         }
         */
        ViewController.section += 1
        /*
        resultsStr.append("Section \(ViewController.section) ------\n")
 */
        //resultsStr.append("\"section\": {")
        let searchPath = (searchResults?[0].searchPath)!
        var businesses = [SearchModel]()
        for searchResult in searchResults! {
            var business = SearchModel()
            if let localbusiness = searchResult.kvDict?["localbusiness"] as? NSArray {
                //resultsStr.append("{")
                if let dict = localbusiness[0] as? NSDictionary {
                    business.thumbnail = dict["image"] as? String
                    business.name = dict["name"] as? String
                    business.telephone = dict["telephone"] as? String
                    business.reviewUrl = searchResult.reviewUrl
                }
                //resultsStr.append("\"name\": \"\(business.name!)\"")
                //resultsStr.append("}\n")
            }
            if let postalAddress = searchResult.kvDict?["postaladdress"] as? NSArray {
                if let dict = postalAddress[0] as? NSDictionary {
                    business.country = dict["addresscountry"] as? String
                    business.locality = dict["addresslocality"] as? String
                    business.region = dict["addressregion"] as? String
                    business.postalcode = dict["postalcode"] as? String
                    business.address = dict["streetaddress"] as? String
                    
                }
            }
            businesses.append(business)
            self.searchResults?[searchPath] = businesses
        }
        
        //activityIndicator.stopAnimating()
        displayResults(businesses, prettyPrinted: true)
    }
    
    private func displayResults(_ searchResults: [SearchModel], prettyPrinted: Bool) {
        
        var resultJson = String()
        resultJson.append("{\"results\":[")
        
        var isFirst = true
        for searchModel in searchResults {
            if !isFirst {
                resultJson.append(",")
            }
            isFirst = false
            let jsonStr = searchModel.toJsonString()
            resultJson.append(jsonStr!)
        }
        
        resultJson.append("]}\n\n\n")
        NSLog(resultJson)
        //if JSONSerialization.isValidJSONObject(resultJson) {
            DispatchQueue.main.async {
                self.scrollView.documentView!.insertText(resultJson)
            }
        //}
    }
    
    private func initSearch() {
        self.searchResults = Dictionary<String, [SearchModel]?>()
        autoSearchManager = AutoSearchManager()
        //activityIndicator.startAnimating()
        let success = autoSearchManager?.search(autoSearchDelegate: self)
        if success == false {
            // display a message
            //createDefaultAutoSearchView()
            //activityIndicator.stopAnimating()
        }
    }
}

