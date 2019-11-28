//
//  NWENetRequest.swift
//  SQLite
//
//  Created by Neal on 2019/11/12.
//  Copyright © 2019 Neal. All rights reserved.
//

import Foundation
import Alamofire

struct NWENetRequest {
    
    fileprivate let path: String
    
    fileprivate let host: String
    
    fileprivate let method: HTTPMethod
    
    fileprivate let param: [String:Any]
    
    fileprivate let headers: HTTPHeaders
    
    fileprivate let urlEncoding: URLEncoding
    
    init(path: String, host: String, method: HTTPMethod, param: [String:Any], headers: HTTPHeaders, urlEncoding: URLEncoding) {
        
        self.path = path
        
        self.host = host
        
        self.method = method
        
        self.param = param
        
        self.headers = headers
        
        self.urlEncoding = urlEncoding
        
    }
    
}

extension NWENetRequest {
    func request() -> NWENetResponse {
        let url = URL(string: self.host + self.path)
        var param = self.param
        
        if NWENetInfo.token_Value.count > 1 {
            param[NWENetInfo.token_Key] = NWENetInfo.token_Value
        }
        
        let request = AF.request(url!, method: self.method, parameters: param, encoding: self.urlEncoding, headers: self.headers)
        let response = NWENetResponse.init(path: self.path, host: self.host, method: self.method, param: self.param, headers: self.headers, urlEncoding: self.urlEncoding, dataRequest: request)
        
        return response
    }

}

