
import Foundation


class SettingsSub {
    
    var submarina: String
    var name: String
    var speed = 1
    var rock = true
    var fish = false
    var ship = true
    
    init(submarina: String, name: String, speed: Int = 1, rock: Bool = true, fish: Bool = false, ship: Bool = true) {
        self.submarina = submarina
        self.name = name
        self.speed = speed
        self.rock = rock
        self.fish = fish
        self.ship = ship
    }
    
    private enum CodingKeys: String, CodingKey {
        case submarina, name, speed, rock, fish, ship
    }
    
    required public init(from decoder: Decoder) throws {
           let container = try decoder.container(keyedBy: CodingKeys.self)
        
        
        self.submarina = try container.decode(String.self, forKey: .submarina)
        self.name = try container.decode(String.self, forKey: .name)
        self.speed = try container.decode(Int.self, forKey: .speed)
        self.rock = try container.decode(Bool.self, forKey: .rock)
        self.fish = try container.decode(Bool.self, forKey: .fish)
        self.ship = try container.decode(Bool.self, forKey: .ship)
        
            
        }
    public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            
        try container.encode(self.submarina, forKey: .submarina)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.speed, forKey: .speed)
        try container.encode(self.rock, forKey: .rock)
        try container.encode(self.fish, forKey: .fish)
        try container.encode(self.ship, forKey: .ship)
        }
    
    
}
