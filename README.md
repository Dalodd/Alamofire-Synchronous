# Alamofire+Synchronous

Synchronous requests for Alamofire

### Requirements

* iOS 8.0+ / Mac OS X 10.9+ / tvOS 9.0+ / watchOS 2.0+


* Xcode 7.1+

### Installation

``` 
pod 'Alamofire-Synchronous', :git => 'https://github.com/Dalodd/Alamofire-Synchronous.git'
```

### Usage

```swift
import Alamofire
import Alamofire_Synchronous
```

**Difference between Alamofire**: just removed the `completionHandler` parameter in response* methods.



Example:

``` swift
//json
let response = Alamofire.request(.GET, "https://httpbin.org/get", parameters: ["foo": "bar"]).responseJSON()
if let json = response.result.value {
	print(json)
}

//download with progress
let response = Alamofire.download(.GET, "https://httpbin.org/stream/100", destination: destination).progress { bytesRead, totalBytesRead, totalBytesExpectedToRead in
	print(bytesRead)
	// This closure is NOT called on the main queue for performance
	// reasons. To update your ui, dispatch to the main queue.
	dispatch_async(dispatch_get_main_queue()) {
		print("Total bytes read on main queue: \(totalBytesRead)")
	}
}.response()
if let error = response.error {
	print("Failed with error: \(error)")
} else {
	print("Downloaded file successfully")
}

//or without
let response = Alamofire.download(.GET, "https://httpbin.org/stream/100", destination: destination).response()
if let error = response.error {
	print("Failed with error: \(error)")
} else {
	print("Downloaded file successfully")
}
```

For more usage, see [Alamofire's documents](https://github.com/Alamofire/Alamofire#usage).

### License

See LICENSE for details.
