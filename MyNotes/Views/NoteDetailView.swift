import SwiftUI

struct NoteDetailView: View {
    @Environment(\.dismiss) private var dismiss
    let viewModel: NotesViewModel
    let note: Note
    
    @State private var title: String
    @State private var content: String
    
    init(viewModel: NotesViewModel, note: Note) {
        self.viewModel = viewModel
        self.note = note
        _title = State(initialValue: note.title)
        _content = State(initialValue: note.content)
    }
    
    var body: some View {
        Form {
            TextField("Title", text: $title)
            TextEditor(text: $content)
                .frame(minHeight: 200)
        }
        .navigationTitle("Edit Note")
        .toolbar {
            Button("Save") {
                viewModel.updateNote(note, title: title, content: content)
                dismiss()
            }
        }
    }
} 