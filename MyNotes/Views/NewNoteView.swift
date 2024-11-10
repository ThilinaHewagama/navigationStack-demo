import SwiftUI

struct NewNoteView: View {
    @Environment(\.dismiss) private var dismiss
    let viewModel: NotesViewModel
    
    @State private var title = ""
    @State private var content = ""
    
    var body: some View {
        Form {
            TextField("Title", text: $title)
            TextEditor(text: $content)
                .frame(minHeight: 200)
        }
        .navigationTitle("New Note")
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") {
                    dismiss()
                }
            }
            ToolbarItem(placement: .confirmationAction) {
                Button("Add") {
                    viewModel.addNote(title: title, content: content)
                    dismiss()
                }
                .disabled(title.isEmpty)
            }
        }
    }
} 