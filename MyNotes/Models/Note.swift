import Foundation

struct Note: Identifiable, Codable {
    var id: UUID
    var title: String
    var content: String
    var dateCreated: Date
    var dateModified: Date
    
    init(id: UUID = UUID(), title: String, content: String, dateCreated: Date = Date(), dateModified: Date = Date()) {
        self.id = id
        self.title = title
        self.content = content
        self.dateCreated = dateCreated
        self.dateModified = dateModified
    }
} 