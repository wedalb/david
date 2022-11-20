package david;

import java.net.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.io.*;

public class Server {

	public static void main(String[] args) throws Exception {
		try (ServerSocket serverSocket = new ServerSocket(8080)) {
			while (true) {
				try (Socket client = serverSocket.accept()) {
					handleClient(client);
				}
			}
		}
	}

	private static void handleClient(Socket client) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(client.getInputStream()));

		StringBuilder requestBuilder = new StringBuilder();
		String line;
		while (!(line = br.readLine()).isBlank()) {
			requestBuilder.append(line + "\r\n");
		}

		String request = requestBuilder.toString();
		String[] requestsLines = request.split("\r\n");
		String[] requestLine = requestsLines[0].split(" ");
		String method = requestLine[0];
		String path = requestLine[1];
		String version = requestLine[2];
		String host = requestsLines[1].split(" ")[1];

		List<String> headers = new ArrayList<>();
		for (int h = 2; h < requestsLines.length; h++) {
			String header = requestsLines[h];
			headers.add(header);
		}

		String accessLog = String.format("Client %s, method %s, path %s, version %s, host %s, headers %s",
				client.toString(), method, path, version, host, headers.toString());
		System.out.println(accessLog);

		String[] pathAndArguments = path.split("/");
		Path filePath = getFilePath(path);
		if (pathAndArguments.length > 2) {
			filePath = getFilePath(pathAndArguments[1] + ", " + pathAndArguments[2] + ".json");
		}

		// arguments (JSON variables/ ML categorization)
		// skipped latitude and longtitude because they are required when in request
		if (pathAndArguments.length == 4) {
			switch (pathAndArguments[3].toLowerCase()) {
			case "name":
				String contentType = guessContentType(filePath);
				sendResponse(client, "200 OK", contentType, JsonFile.getName(filePath).getBytes());
				break;
			case "notes":
				String contentType3 = guessContentType(filePath);
				sendResponse(client, "200 OK", contentType3, JsonFile.getNotes(filePath).getBytes());
				break;
			case "ml":
				break;
			default:
				if (Files.exists(filePath)) {
					// file exist
					String contentType2 = guessContentType(filePath);
					sendResponse(client, "200 OK", contentType2, Files.readAllBytes(filePath));
				} else {
					// 404
					byte[] notFoundContent = "<h1>Sorry, there are currently no sticker notes at this location</h1>"
							.getBytes();
					sendResponse(client, "404 Not Found", "text/html", notFoundContent);
				}
				break;
			}
		} else {
			if (Files.exists(filePath)) {
				// file exist
				String contentType = guessContentType(filePath);
				sendResponse(client, "200 OK", contentType, Files.readAllBytes(filePath));
			} else {
				// 404
				byte[] notFoundContent = "<h1>Sorry, there are currently no sticker notes at this location</h1>"
						.getBytes();
				sendResponse(client, "404 Not Found", "text/html", notFoundContent);
			}
		}

	}

	private static void sendResponse(Socket client, String status, String contentType, byte[] content)
			throws IOException {
		OutputStream clientOutput = client.getOutputStream();
		clientOutput.write(("HTTP/1.1 \r\n" + status).getBytes());
		clientOutput.write(("ContentType: " + contentType + "\r\n").getBytes());
		clientOutput.write("\r\n".getBytes());
		clientOutput.write(content);
		clientOutput.write("\r\n\r\n".getBytes());
		clientOutput.flush();
		client.close();
	}

	private static Path getFilePath(String path) {
		if ("/".equals(path)) {
			path = "test.txt";
		}

		return Paths.get("C:\\Users\\Public\\HackaTUM", path);
	}

	private static String guessContentType(Path filePath) throws IOException {
		return Files.probeContentType(filePath);
	}

	// within approximately 500 meters is defined as close
	public boolean isClose(double lat1, double lon1, double lat2, double lon2) {
		return Math.abs(lat1 - lat2) <= 0.005 && Math.abs(lat1 - lat2) <= 0.005;
	}
}
