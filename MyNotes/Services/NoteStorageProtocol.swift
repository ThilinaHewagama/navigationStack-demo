import Foundation

protocol NoteStorageProtocol {
    func saveNotes(_ notes: [Note]) throws
    func loadNotes() throws -> [Note]
} 