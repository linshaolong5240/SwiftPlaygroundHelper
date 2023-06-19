import Foundation

//let url: URL = URL(string: "MyApp://home/action?id=10000&name=username")!
let url: URL = URL(string: "MyApp:///CheckIn/user?id=C2D5A6DA-5075-466C-AFBA-02F81C043483#1&family=0")!
let url2: URL = URL(string: "MyApp:///CheckIn?id=C2D5A6DA-5075-466C-AFBA-02F81C043483#1&family=0")!

url.absoluteString
url.absoluteURL
url.baseURL
url.fragment
url.host
url.lastPathComponent
url.path
url.pathComponents
url.pathExtension
url.port
url.query
url.relativePath
url.relativeString
url.scheme
url.standardized
url.standardizedFileURL
url.user
url.password

var com = URLComponents()
com.path = "/CheckIn/user"
com.queryItems?.append(URLQueryItem(name: "name", value: "value"))
//com.scheme = "MyApp://"
com.queryItems
com.url?.absoluteString
com.percentEncodedQuery

func handleURL(url: URL) {
    let components = URLComponents(url: url, resolvingAgainstBaseURL: false)

    guard let scheme = components?.scheme, scheme.contains("MyApp") else {
        return
    }
    
    let queryItems = components?.queryItems
    
    switch url.path {
    case "action":
        break
    default: break
    }
    
}
