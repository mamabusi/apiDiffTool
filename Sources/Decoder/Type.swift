import Foundation

struct Type: Codable {
    let name: String
    let accessModifier: String
    let inheritedTypes: [InheritType]
    let methods: [Method]?
    let properties: [Property]?
    let enums: [EnumType]?
    enum  CodingKeys : String, CodingKey {
       case name: "key.name"
       case accessModifier: "key.accessibility"
       case inheritedTypes: "key.inheritedTypes"
    }
}


public struct InheritType: Codable {
    let name: String
    enum CodingKeys : String, CodingKey {
        case name = "key.name"
    }
}


