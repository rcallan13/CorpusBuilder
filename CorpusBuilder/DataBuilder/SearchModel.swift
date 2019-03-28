//
//  SearchModel.swift
//  CorpusBuilder
//
//  Created by Ron Allan on 2019-03-26.
//  Copyright © 2019 RCAL Software Solutions. All rights reserved.
//

import Foundation

struct SearchModel: Codable {
    var searchname: String?
    var name: String?
    var telephone: String?
    var thumbnail: String?
    var country: String?
    var locality: String?
    var region: String?
    var postalcode: String?
    var address: String?
    var reviews: [String?]?
    var reviewUrl: String?
    
    func toJsonString() -> String? {
        do {
            let jsonEncoder = JSONEncoder()
            jsonEncoder.outputFormatting = .prettyPrinted
            let jsonData = try jsonEncoder.encode(self)
            let json = String(data: jsonData, encoding: String.Encoding.utf8)
            return json
        } catch {
            
        }
        return nil
    }
}
