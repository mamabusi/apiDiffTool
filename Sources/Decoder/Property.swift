import Foundation

struct Property: Codable {
    let name: String
    let accessModifier: String
    let typeName: String
    enum  CodingKeys : String, CodingKey {
       case name = "key.name"
       case accessModifier = "key.accessibility"
       case typeName = "key.typename"
    }
}
