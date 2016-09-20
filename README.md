# Alamofire+Synchronous

Synchronous requests for Alamofire

### Requirements

* iOS 9.0+ / Mac OS X 10.11+ / tvOS 9.0+ / watchOS 2.0+


* Xcode 8.0+
* Swift 3.0+

### Installation

``` ruby
pod 'Alamofire-Synchronous', '~> 4.0'
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
let response = Alamofire.request("https://httpbin.org/get", method: .get, , parameters: ["foo": "bar"]).responseJSON()
if let json = response.result.value {
	print(json)
}

//download with progress
let response = Alamofire.download("https://httpbin.org/stream/100", method: .get, to: destination).downloadProgress { progress in
        print("Download Progress: \(progress.fractionCompleted)")
}.response()
if let error = response.error {
	print("Failed with error: \(error)")
} else {
	print("Downloaded file successfully")
}

//or without
let response = Alamofire.download"https://httpbin.org/stream/100", method: .get, to: destination).response()
if response.result.isSuccess {
	print("Downloaded file successfully")
}else{
	print("Failed with error: \(error)")
}
```

For more usage, see [Alamofire's documents](https://github.com/Alamofire/Alamofire#usage).

### License

See LICENSE for details.
