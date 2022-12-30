import Foundation
import Logging
import Supabase


/// A viewmodel to load a list of notes from the server
class LeaderBoardViewModel : ObservableObject {
    @Published var hasError = false
    private let logger = Logger(label: "LeaderBoardViewModel")
    // newly created notes go here
    @Published var createdNotes: Note = Note()
    @Published var notes: [Note]?

    func getNotes() {
        getAllNotes { notes in
            self.notes = notes
        }
    }
    @Published var sortByTitleDescending = false
    
    var sortedNotes: [Note] {
        if sortByTitleDescending {
            return notes!.sorted { (lhs: Note, rhs: Note) -> Bool in
                return lhs.title > rhs.title
            }
        } else {
            return notes!.sorted { (lhs: Note, rhs: Note) -> Bool in
                return lhs.title < rhs.title
            }
        }
    }
    
    func setByTitleDescending(isDescending: Bool) {
        sortByTitleDescending = isDescending
    }
    

 /*   // A function to load our notes when we re in the maps view
    func load() async {
        logger.info("LeaderBoardViewModel will load info now")
        DispatchQueue.main.async {
            self.hasError = false
        }
        logger.info("Deciding wether it ll die or not")
        do {
            logger.info("in do block")
            let notes: [NoteStruct]
        //    try notes = await RequestHandler.shared.fetchNotes()
            logger.info("Fetched some data")
 //           DispatchQueue.main.async { // to publish movies in main thread
                self.notes = notes
            }
        } catch {
            logger.error("Error \(error)")
            DispatchQueue.main.async {
                self.hasError = true
                
            
            }
        }
    }*/
}
