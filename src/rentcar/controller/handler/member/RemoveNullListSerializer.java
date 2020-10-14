package rentcar.controller.handler.member;

import java.lang.reflect.Type;
import java.util.Collections;
import java.util.List;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonSerializationContext;
import com.google.gson.JsonSerializer;

public class RemoveNullListSerializer<T> implements JsonSerializer<List<T>> {

	@Override
	public JsonElement serialize(List<T> src, Type typeOfSrc, JsonSerializationContext context) {

		// remove all null values
		src.removeAll(Collections.singleton(null));

		// create json Result
		JsonArray result = new JsonArray();
		for (T item : src) {
			result.add(context.serialize(item));
		}

		return result;
	}

}
