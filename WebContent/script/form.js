/*
 * input[type=number]에서 maxlength 먹히지 않을 때 사용
 * */
function maxLengthCheck(object) {
	if (object.value.length > object.maxLength) {
		object.value = object.value.slice(0, object.maxLength);
	}
}

