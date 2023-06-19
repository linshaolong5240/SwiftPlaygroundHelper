import Cocoa

enum SPError: Error {
    case error1, error2
    var localizedDescription: String {
        switch self {
        case .error1:
            return "error1 localizedDescription"
        case .error2:
            return "error2 localizedDescription"
        }
    }
}

print(SPError.error1)
// SPError 必须实现属性localizedDescription
print(SPError.error1.localizedDescription)
