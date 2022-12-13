import Foundation
import Logging
import Supabase


/// A viewmodel to load a list of notes from the server
class LeaderBoardViewModel : ObservableObject {
    @Published var hasError = false
    private let logger = Logger(label: "LeaderBoardViewModel")
    // newly created notes go here
    @Published var notes: [NoteStruct] = []
    @Published var createdNotes: NoteStruct = NoteStruct()
    
    // That way we connect to supabase where our table is stored
    lazy var client = SupabaseClient(supabaseURL: URL(string: "https://jodkgsfhjztbcgmcndti.supabase.co")!,
                                     supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpvZGtnc2Zoanp0YmNnbWNuZHRpIiwicm9sZSI6ImFub24iLCJpYXQiOjE2Njg4NTM4NTUsImV4cCI6MTk4NDQyOTg1NX0.mTSLfxdVGoZ5EAMG8Dygnn89SdA3hlOm2DGwGYr7SiQ")

    
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
    
    func getNotes() async throws {
        let query = client
            .database
            .from("notes_table")
            .select()
        
        guard let response = try? await query.execute(),
              let createdNotes = try? response.decoded(to: [NoteStruct].self)
        else {
            print("error encoding notes")
            throw NSError()
        }
        
        DispatchQueue.main.async {
            self.notes = createdNotes
        }
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
