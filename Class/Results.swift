
import Foundation


class Results {
    
    var name : String
    var score : Int
    var speed : Int
    
    
    init(name: String, score: Int, speed: Int) {
        self.name = name
        self.score = score
        self.speed = speed
    }
    
    private enum CodingKeys: String, CodingKey {
        case name, score, speed
    }
    
    required public init(from decoder: Decoder) throws {
           let container = try decoder.container(keyedBy: CodingKeys.self)
            
            self.name = try container.decode(String.self, forKey: .name)
            self.score = try container.decode(Int.self, forKey: .score)
            self.speed = try container.decode(Int.self, forKey: .speed)
            
        }
    public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            
            try container.encode(self.name, forKey: .name)
            try container.encode(self.score, forKey: .score)
            try container.encode(self.speed, forKey: .speed)
        }
    
    
}
