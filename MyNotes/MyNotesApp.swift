//
//  MyNotesApp.swift
//  MyNotes
//
//  Created by Thilina Chamath Hewagama on 2024-11-10.
//

import SwiftUI

@main
struct MyNotesApp: App {
    @State private var path = NavigationPath()
    @StateObject private var notesViewModel = NotesViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $path) {
                NotesListView(viewModel: notesViewModel, path: $path)
                    .navigationDestination(for: Screen.self) { screen in
                        switch screen {
                        case .notesList:
                            NotesListView(viewModel: notesViewModel, path: $path)
                        case .newNote:
                            NewNoteView(viewModel: notesViewModel)
                        case .noteDetail(let note):
                            NoteDetailView(viewModel: notesViewModel, note: note)
                        }
                    }
            }
        }
    }
}
