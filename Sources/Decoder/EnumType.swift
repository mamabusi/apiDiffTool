import Foundation

struct EnumType : Codable {
    let name: String
    let accessModifier: String
    let inheritedTypes: [InheritType]
    let enumCases: [String]
    enum  CodingKeys : String, CodingKey {
       case name = "key.name"
       case accessModifier = "key.accessibility"
       case inheritedTypes = "key.inheritedTypes"
       case enumCases
    }
}

