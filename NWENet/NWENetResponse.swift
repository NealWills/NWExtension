//
//  NWENetResponse.swift
//  SQLite
//
//  Created by Neal on 2019/11/12.
//  Copyright © 2019 Neal. All rights reserved.
//

import Foundation
import Alamofire

struct NWENetResponse {
    
    fileprivate let path: String
    
    fileprivate let host: String
    
    fileprivate let method: HTTPMethod
    
    fileprivate let param: [String:Any]
    
    fileprivate let headers: HTTPHeaders
    
    fileprivate let urlEncoding: URLEncoding
    
    fileprivate let dataRequest: DataRequest
    
    init(path: String, host: String, method: HTTPMethod, param: [String:Any], headers: HTTPHeaders, urlEncoding: URLEncoding, dataRequest: DataRequest) {
        
        self.path = path
        
        self.host = host
        
        self.method = method
        
        self.param = param
        
        self.headers = headers
        
        self.urlEncoding = urlEncoding
        
        self.dataRequest = dataRequest
        
    }
}

extension NWENetResponse {
    func response(_ response:@escaping ([String:Any]?, Error?)->()) {
        
        self.dataRequest.responseJSON { (res) in
//            if res.result.isSuccess {
//                let jsonData:Data = res.data!
//                let dict:Dictionary = try! JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers) as! [String:Any]
//                response(dict, nil)
//                
//            } else {
//                response(nil, res.error)
//            }
        }
    }
}
