package david.datahandlers;
import java.util.HashMap;
import java.util.Map;


public class DataHandler {


        //We basically map the title of the note to the id
        private Map<String, Note> notesMap = new HashMap<>();

        //this class is a singleton and should not be instantiated directly!
        private static DataHandler instance = new DataHandler();
        public static DataHandler getInstance(){
            return instance;
        }

        //private constructor so people know to use the getInstance() function instead
        private DataHandler(){
            //dummy data normally
        }

        public Note getNote(String id) {
            return notesMap.get(id);
        }

        public void putNote(Note note) {
            notesMap.put(note.getId(), note);
        }

}
