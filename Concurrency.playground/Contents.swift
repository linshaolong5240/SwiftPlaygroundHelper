import Cocoa
import Foundation

func loadSignature() async throws -> String? {
    let (data, _) = try await URLSession.shared.data(from: URL(string: "http://www.baidu.com")!)
    print("loadSignature1")
    return String(data: data, encoding: .utf8)
}

func loadFromDatabase() async throws -> String? {
    let (data, _) = try await URLSession.shared.data(from: URL(string: "http://www.baidu.com")!)
    print("loadFromDatabase")
    return String(data: data, encoding: .utf8)
}

var results: [String] = []

//func someSyncMethod() {
//    Task {
//        try await processFromScratch()
//        print("Done: \(results)")
//    }
//}

func processFromScratch() throws {
    Task {
        if let strings = try await loadFromDatabase() {
            results.append(strings)
        }
        
        if let signature = try await loadSignature() {
            results.append(signature)
        } else {
            print("processFromScratch: error")
        }
    }

}

//someSyncMethod()
try processFromScratch()
