import Foundation

struct Method: Codable {
    let name: String
    let accessModifier: String
    enum  CodingKeys : String, CodingKey {
       case name: "key.name"
       case accessModifier: "key.accessibility"
    }
}

