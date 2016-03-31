//
//  Alamofire+Synchronous.swift
//  Alamofire-Synchronous
//
//  Created by Luda Zhuang on 15/11/8.
//  Copyright © 2015年 Luda Zhuang. All rights reserved.
//

import Foundation
import Alamofire
extension Request {
    public func response() -> (request: NSURLRequest?, response: NSHTTPURLResponse?, data: NSData?, error: NSError?) {
        let semaphore = dispatch_semaphore_create(0)
        var result: (request: NSURLRequest?, response: NSHTTPURLResponse?, data: NSData?, error: NSError?)!
        self.response(queue: dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), completionHandler: { request, response, data, error in
            result = (
                request: request,
                response: response,
                data: data,
                error: error
            )
            dispatch_semaphore_signal(semaphore);
        })
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER)
        return result
    }
    
    public func responseData() -> Response<NSData, NSError> {
        let semaphore = dispatch_semaphore_create(0)
        var result: Response<NSData, NSError>!
        self.responseData(queue: dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), completionHandler: { response in
            result = response
            dispatch_semaphore_signal(semaphore);
        })
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER)
        return result
    }
    
    public func responseJSON(options options: NSJSONReadingOptions = .AllowFragments) -> Response<AnyObject, NSError> {
        let semaphore = dispatch_semaphore_create(0)
        var result: Response<AnyObject, NSError>!
        self.responseJSON(queue: dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), options: options, completionHandler: {response in
            result = response
            dispatch_semaphore_signal(semaphore);
        })
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER)
        return result
    }
    
    public func responseString(encoding encoding: NSStringEncoding? = nil) -> Response<String, NSError> {
        let semaphore = dispatch_semaphore_create(0)
        var result: Response<String, NSError>!
        self.responseString(queue: dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), encoding: encoding, completionHandler: { response in
            result = response
            dispatch_semaphore_signal(semaphore);
        })
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER)
        return result
    }
    
    public func responsePropertyList(options options: NSPropertyListReadOptions = NSPropertyListReadOptions()) -> Response<AnyObject, NSError> {
        let semaphore = dispatch_semaphore_create(0)
        var result: Response<AnyObject, NSError>!
        self.responsePropertyList(queue: dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), options: options, completionHandler: { response in
            result = response
            dispatch_semaphore_signal(semaphore);
        })
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER)
        return result
    }
}