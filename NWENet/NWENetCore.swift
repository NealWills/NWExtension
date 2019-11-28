//
//  NWENetCore.swift
//  SQLite
//
//  Created by Neal on 2019/11/11.
//  Copyright © 2019 Neal. All rights reserved.
//

import Foundation

import Alamofire

struct NWENetInfo {
    
    static var token_Key = "token"
    static var token_Value = ""
    
    static var time_Key = ""
    static var time_Value: String! {
        get {
            return ""
        }
    }
    
}

class NWENetCore {
    
    fileprivate var _method: HTTPMethod = .post
    fileprivate var _host: String = ""
    fileprivate var _path: String = ""
    fileprivate var _param: [String:Any] = [:]
    fileprivate var _headers: HTTPHeaders = [:]
    fileprivate var _urlEncoding: URLEncoding = .default
    
    fileprivate var _request: NWENetRequest!
    
    deinit {
        Log.Info("Deinit")
    }
    
}

extension NWNetExtensionWrapper where Base: NWENetCore {
    
    func setMethod(_ method: HTTPMethod) -> NWNetExtensionWrapper {
        self.base._method = method
        return self
    }
    
    func setPath(_ path: String) -> NWNetExtensionWrapper {
        self.base._path = path
        return self
    }
    
    func setHost(_ host: String) -> NWNetExtensionWrapper {
        self.base._host = host
        return self
    }
    
    func setParam(_ param: [String:Any]) -> NWNetExtensionWrapper {
        self.base._param = param
        return self
    }

    func setUrlEncoding(_ urlEncoding: URLEncoding) -> NWNetExtensionWrapper {
        self.base._urlEncoding = urlEncoding
        return self
    }
}

extension NWNetExtensionWrapper where Base: NWENetCore {
    
    var request: NWENetResponse! {
        get {
            self.base._request = NWENetRequest.init(path: self.base._path, host: self.base._host, method: self.base._method, param: self.base._param, headers: self.base._headers, urlEncoding: self.base._urlEncoding)
            
            return self.base._request.request()
        }
    }
    
    
}

