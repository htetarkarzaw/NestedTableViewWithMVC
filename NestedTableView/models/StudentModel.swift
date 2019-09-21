//
//  StudentModel.swift
//  NestedTableView
//
//  Created by Htet Arkar Zaw on 9/22/19.
//  Copyright © 2019 Htet Arkar Zaw. All rights reserved.
//

import Foundation
class StudentModel{
    
    var studentResponse: [ParentVO] = []
    
    class func shared() -> StudentModel {
        return sharedMovieModel
    }
    private static var sharedMovieModel : StudentModel = {
        let studentModel = StudentModel()
        return studentModel
    }()
    
    func apiGetParentList(success : @escaping () ->Void,
                         failure : @escaping (String) ->Void){
        NetworkClient.shared().getData(success: { (data) in
            guard let data = data as? Data else { return }
            do{
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                self.studentResponse = try
                    decoder.decode([ParentVO].self, from: data)
                success()
            } catch let jsonErr{
                failure(jsonErr.localizedDescription)
            }
        }) { (err) in
            failure(err)
        }
    }
}
