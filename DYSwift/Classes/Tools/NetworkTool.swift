//
//  NetworkTool.swift
//  AlamFire
//
//  Created by maker on 2016/12/3.
//  Copyright © 2016年 maker. All rights reserved.
//

import UIKit
import Alamofire

enum MethodType {
    case GET
    case POST
}



class NetworkTool {
    static let shareInstance : NetworkTool = NetworkTool()

    func reqest(method:MethodType,url:String,params:[String:Any]?=nil,finished:@escaping ( _ result:[String:Any]?, _ error:Error?) -> ()) {
        
        let methods = method == .GET ? HTTPMethod.get : HTTPMethod.post
        
        Alamofire.request(url, method: methods, parameters: params).responseJSON(completionHandler: { (response) in
            
            guard let value = response.result.value else{
                
                finished(nil, response.result.error)
                return
            }
            finished((value as![String:AnyObject]), nil)
        })
 
    }
}
