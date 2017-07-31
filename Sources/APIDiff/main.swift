import Foundation

struct APIDiff {
    var text = "Hello, World!"
}

struct SubStructure : Decodable {
    let name: String
    let kind: String
    let accessibility: String?

    enum CodingKeys: String, CodingKey {
        case name = "key.name"
        case kind = "key.kind"
        case accessibility = "key.accessibility"
    }
}

extension SubStructure {
     init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let name = try container.decode(String.self, forKey: .name)
        let kind = try container.decode(String.self, forKey: .kind)
        let accessibility = try container.decodeIfPresent(String.self, forKey: .accessibility)
        self.init(name: name, kind: kind, accessibility: accessibility)
    }
}

struct SubStructures : Decodable {
    let substructures: [SubStructure]

    enum CodingKeys: String, CodingKey {
        case substructures = "key.substructure"
    }
}


public func main() {
    do {
        var jsonData = try Data(contentsOf: URL(fileURLWithPath: "/Users/mamatha/Documents/swift/APIDiffTool/SourceKittenOutput/CalendarLinux.txt"))
        let decoder = JSONDecoder()
        let substructures = try decoder.decode(SubStructures.self, from: jsonData)
        print("Exception 1")
        for substructure in substructures.substructures {
        print(substructure)
        }
        var jsonDataMac = try Data(contentsOf: URL(fileURLWithPath: "/Users/mamatha/Documents/swift/APIDiffTool/SourceKittenOutput/CalendarMac.txt"))
        let decoder1 = JSONDecoder()
        let substructuresMac = try decoder1.decode(SubStructures.self, from: jsonDataMac)
        for substructureMac in substructuresMac.substructures {
            print("Mac: \(substructureMac)")
        }
    } catch {
        print("Exception 3")
    }
}
