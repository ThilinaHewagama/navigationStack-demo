import Foundation

@MainActor
class NotesViewModel: ObservableObject {
    @Published private(set) var notes: [Note] = []
    private let storageService: NoteStorageProtocol
    
    init(storageService: NoteStorageProtocol = NoteStorageService()) {
        self.storageService = storageService
        loadNotes()
    }
    
    private func loadNotes() {
        do {
            notes = try storageService.loadNotes()
        } catch {
            print("Error loading notes: \(error)")
        }
    }
    
    func addNote(title: String, content: String) {
        let note = Note(title: title, content: content)
        notes.append(note)
        saveNotes()
    }
    
    func updateNote(_ note: Note, title: String, content: String) {
        if let index = notes.firstIndex(where: { $0.id == note.id }) {
            notes[index] = Note(id: note.id, title: title, content: content, dateCreated: note.dateCreated, dateModified: Date())
            saveNotes()
        }
    }
    
    func deleteNote(_ note: Note) {
        notes.removeAll { $0.id == note.id }
        saveNotes()
    }
    
    private func saveNotes() {
        do {
            try storageService.saveNotes(notes)
        } catch {
            print("Error saving notes: \(error)")
        }
    }
} 