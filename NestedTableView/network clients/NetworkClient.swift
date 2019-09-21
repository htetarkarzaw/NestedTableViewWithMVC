//
//  NetworkClient.swift
//  NestedTableView
//
//  Created by Htet Arkar Zaw on 9/22/19.
//  Copyright © 2019 Htet Arkar Zaw. All rights reserved.
//

import Foundation
import Alamofire

class NetworkClient{
    
    private let baseUrl : String
    
    private init(baseUrl : String){
        self.baseUrl = baseUrl
    }
    
    private static var sharedNetwrokClient : NetworkClient = {
        let url = AppConstants.BASE_URL
        return NetworkClient(baseUrl: url)
    }()
    
    class func shared() -> NetworkClient{
        return sharedNetwrokClient
    }
    
    public func getData (success : @escaping (Any) -> Void,
                         failure : @escaping (String) -> Void){
        Alamofire.request(baseUrl).responseData { (response) in
            switch response.result{
            case .success:
                guard let data = response.result.value else {return}
                success(data)
                break
                
            case . failure(let err):
                failure(err.localizedDescription)
                break
            }
            
        }
    }
    
}
