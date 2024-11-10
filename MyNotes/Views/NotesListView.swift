import SwiftUI

struct NotesListView: View {
    @ObservedObject var viewModel: NotesViewModel
    @Binding var path: NavigationPath
    
    var body: some View {
        VStack {
            List {
                ForEach(viewModel.notes) { note in
                    Button {
                        path.append(Screen.noteDetail(note))
                    } label: {
                        VStack(alignment: .leading) {
                            Text(note.title)
                                .font(.headline)
                            Text(note.dateModified.formatted())
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                }
                .onDelete { indexSet in
                    indexSet.forEach { index in
                        viewModel.deleteNote(viewModel.notes[index])
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationTitle("Notes")
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button {
                    path.append(Screen.newNote)
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
} 
