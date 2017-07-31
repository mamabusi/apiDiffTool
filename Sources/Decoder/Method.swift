import Foundation

struct Method: Codable {
    let name: String
    let accessModifier: String
    let property: [Property]?
    enum  CodingKeys : String, CodingKey {
       case name = "key.name"
       case accessModifier = "key.accessibility"
       case property
    }
}

