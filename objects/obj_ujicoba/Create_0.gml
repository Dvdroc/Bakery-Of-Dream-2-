lines = [];
var file = file_text_open_read("8 5 7.txt");
while (!file_text_eof(file)){
	var line = file_text_read_string(file)
	array_push(lines, line);
	file_text_readln(file);
}
file_text_close(file)
dialog_index = 0;
show_debug_message(lines);