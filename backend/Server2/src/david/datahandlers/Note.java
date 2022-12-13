package david.datahandlers;

/***
 * This Class provides the nessecary information to store a note
 */
public class Note {

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNote_title() {
        return note_title;
    }

    public void setNote_title(String note_title) {
        this.note_title = note_title;
    }

    public String getNote_description() {
        return note_description;
    }

    public void setNote_description(String note_description) {
        this.note_description = note_description;
    }

    public String getNote_location_latitude() {
        return note_location_latitude;
    }

    public void setNote_location_latitude(String note_location_latitude) {
        this.note_location_latitude = note_location_latitude;
    }

    public String getNote_location_longitude() {
        return note_location_longitude;
    }

    public void setNote_location_longitude(String note_location_longitude) {
        this.note_location_longitude = note_location_longitude;
    }

    public String getNote_category() {
        return note_category;
    }

    public void setNote_category(String note_category) {
        this.note_category = note_category;
    }

    public String getNote_created_at() {
        return note_created_at;
    }

    public void setNote_created_at(String note_created_at) {
        this.note_created_at = note_created_at;
    }

    public String getNote_author() {
        return note_author;
    }

    public void setNote_author(String note_author) {
        this.note_author = note_author;
    }

    private String id;
    private String note_title;
    private String note_description;
    private String note_location_latitude;
    private String note_location_longitude;
    private String note_category;
    private String note_created_at;
    private String note_author;


    public Note(String id, String note_title,
                String note_description, String note_location_latitude,
                String note_location_longitude, String note_category,
                String note_created_at, String note_author){

        this.id = id;
        this.note_author = note_author;
        this.note_category = note_category;
        this.note_created_at = note_created_at;
        this.note_description = note_description;
        this.note_location_latitude = note_location_latitude;
        this.note_title = note_title;
        this.note_location_longitude = note_location_longitude;
    }
}
