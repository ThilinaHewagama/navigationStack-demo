enum Screen: Hashable {
    case notesList
    case newNote
    case noteDetail(Note)
    
    static func == (lhs: Screen, rhs: Screen) -> Bool {
        switch (lhs, rhs) {
        case (.notesList, .notesList):
            return true
        case (.newNote, .newNote):
            return true
        case (.noteDetail(let note1), .noteDetail(let note2)):
            return note1.id == note2.id
        default:
            return false
        }
    }
    
    func hash(into hasher: inout Hasher) {
        switch self {
        case .notesList:
            hasher.combine(0)
        case .newNote:
            hasher.combine(1)
        case .noteDetail(let note):
            hasher.combine(2)
            hasher.combine(note.id)
        }
    }
} 
