package david;


import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class JsonFile {

	public static String getName(Path path) {
		String fileStr = null;
		try {
			fileStr = new String(Files.readAllBytes(path));
		} catch (IOException e) {
			e.printStackTrace();
		}
		JSONArray array = parse(fileStr);
		String tmp = array.get(0).toString().split(":")[1];
		return tmp.substring(1, tmp.length() - 2);
	}

	public static String getNotes(Path path) {
		String fileStr = null;
		try {
			fileStr = new String(Files.readAllBytes(path));
		} catch (IOException e) {
			e.printStackTrace();
		}
		JSONArray array = parse(fileStr);
		return array.get(3).toString();
	}

	public static JSONArray parse(String input) {
		JSONParser parser = new JSONParser();
		JSONArray array = null;
		try {
			array = (JSONArray) parser.parse(input);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		return array;
	}

	public static void main(String[] args) throws IOException {
		String example = new String(Files
				.readAllBytes(Paths.get("C:\\Users\\Public\\HackaTUM\\48.262700611408555, 11.66794478300002.json")));
		System.out.println(parse(new String(Files
				.readAllBytes(Paths.get("C:\\Users\\Public\\HackaTUM\\48.137507736738335, 11.575502142518554.json")))));
	}
}