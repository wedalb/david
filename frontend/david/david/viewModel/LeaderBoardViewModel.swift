import Foundation


/// A viewmodel to load a list of notes from the server
class LeaderBoardViewModel : ObservableObject {
    @Published var notes: [NoteStruct] = []
    @Published var hasError = false

    
    @Published var sortByTitleDescending = false
    
    var sortedNotes: [NoteStruct] {
        if sortByTitleDescending {
            return notes.sorted { (lhs: NoteStruct, rhs: NoteStruct) -> Bool in
                return lhs.note_title > rhs.note_title
            }
        } else {
            return notes.sorted { (lhs: NoteStruct, rhs: NoteStruct) -> Bool in
                return lhs.note_title < rhs.note_title
            }
        }
    }
    
    func setByTitleDescending(isDescending: Bool) {
        sortByTitleDescending = isDescending
    }
    
    
    
    // A function to load our notes when we re in the maps view
    func load() async {
        DispatchQueue.main.async {
            self.hasError = false
        }
        do {
            let notes: [NoteStruct]
            try notes = await RequestHandler.shared.fetchNotes()
            DispatchQueue.main.async { // to publish movies in main thread
                self.notes = notes
            }
        } catch {
            DispatchQueue.main.async {
                self.hasError = true
            }
        }
    }
}
