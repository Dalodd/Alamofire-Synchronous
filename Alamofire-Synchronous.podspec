Pod::Spec.new do |s|

  s.name         = "Alamofire-Synchronous"
  s.version      = "0.0.2"
  s.summary      = "Synchronous requests for Alamofire"
  s.homepage     = "https://github.com/zhuangluda/Alamofire-Synchronous"
  s.license = 'MIT'
  s.author = { "Hran" => "zhuangluda@gmail.com" }
  s.source = { :git => "https://github.com/zhuangluda/Alamofire-Synchronous.git", :tag => s.version }

  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.9"
  s.watchos.deployment_target = "2.0"
  s.tvos.deployment_target = "9.0"

  s.source_files = 'Source/*.swift'
  s.requires_arc = true

  s.dependency "Alamofire", "~> 3.0"

end
