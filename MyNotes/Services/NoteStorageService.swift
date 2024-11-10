import Foundation

class NoteStorageService: NoteStorageProtocol {
    private let key = "saved_notes"
    
    func saveNotes(_ notes: [Note]) throws {
        let data = try JSONEncoder().encode(notes)
        UserDefaults.standard.set(data, forKey: key)
    }
    
    func loadNotes() throws -> [Note] {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return []
        }
        return try JSONDecoder().decode([Note].self, from: data)
    }
} 