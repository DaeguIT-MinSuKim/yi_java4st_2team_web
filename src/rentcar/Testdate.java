package rentcar;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class Testdate {
	public static void main(String[] args) {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");
		String date = LocalDateTime.of(2020, 10, 17, 15, 0, 0).format(formatter);
		System.out.println(date);
	}
}
