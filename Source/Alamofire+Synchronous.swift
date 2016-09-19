//
//  Alamofire+Synchronous.swift
//  Alamofire-Synchronous
//
//  Created by Luda Zhuang on 15/11/8.
//  Copyright © 2015年 Luda Zhuang. All rights reserved.
//

import Foundation
import Alamofire

extension DataRequest {
    
    
    /**
     Wait for the request to finish then return the response value.
     
     - returns: The response.
     */
    public func response() -> DefaultDataResponse {
        
        let semaphore = DispatchSemaphore(value: 0)
        var result: DefaultDataResponse!

        self.response(queue: DispatchQueue.global(qos: .default)){ response in
            
            result = response
            
            semaphore.signal()
        }
        
        _ = semaphore.wait(timeout: DispatchTime.distantFuture)
        
        return result
    }
    
    
    /**
     Wait for the request to finish then return the response value.
     
     - returns: The response.
     */
    public func responseData() -> DataResponse<Data> {
        
        let semaphore = DispatchSemaphore(value: 0)
        
        var result: DataResponse<Data>!
        
        self.responseData(queue: DispatchQueue.global(qos: .default)) { response in
            
            result = response
            semaphore.signal()
            
        }
        
        _ = semaphore.wait(timeout: DispatchTime.distantFuture)
        
        return result
    }
    
    
    /**
     Wait for the request to finish then return the response value.
     
     - parameter options: The JSON serialization reading options. `.AllowFragments` by default.
     
     - returns: The response.
     */
    public func responseJSON(options: JSONSerialization.ReadingOptions = .allowFragments) -> DataResponse<Any> {
        
        let semaphore = DispatchSemaphore(value: 0)
        
        var result: DataResponse<Any>!
        
        self.responseJSON(queue: DispatchQueue.global(qos: .default), options: options) { response in
            
            result = response
            semaphore.signal()
            
        }
        
        _ = semaphore.wait(timeout: DispatchTime.distantFuture)
        
        return result
    }
    
    
    /**
     Wait for the request to finish then return the response value.
     
     - parameter encoding: The string encoding. If `nil`, the string encoding will be determined from the
     server response, falling back to the default HTTP default character set,
     ISO-8859-1.
     
     - returns: The response.
     */
    public func responseString(encoding: String.Encoding? = nil) -> DataResponse<String> {
        
        let semaphore = DispatchSemaphore(value: 0)
        
        var result: DataResponse<String>!
        self.responseString(queue: DispatchQueue.global(qos: .default), encoding: encoding){ response in
            
            result = response
            semaphore.signal()
            
        }
        
        _ = semaphore.wait(timeout: DispatchTime.distantFuture)
        
        return result
    }
    
    
    /**
     Wait for the request to finish then return the response value.
     
     - parameter options: The property list reading options. `0` by default.
     
     - returns: The response.
     */
    public func responsePropertyList(options: PropertyListSerialization.ReadOptions = PropertyListSerialization.ReadOptions()) -> DataResponse<Any> {
        
        let semaphore = DispatchSemaphore(value: 0)
        
        var result: DataResponse<Any>!
        
        self.responsePropertyList(queue: DispatchQueue.global(qos: .default), options: options) { response in
            
            result = response
            semaphore.signal()
            
        }
        
        _ = semaphore.wait(timeout: DispatchTime.distantFuture)
        
        return result
    }
}
