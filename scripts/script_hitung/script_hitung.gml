function script_hitung(){
	
	if (keyboard_check_pressed(ord("W"))) craft_amount = clamp(craft_amount + 1, 1, max_amount);
	if (keyboard_check_pressed(ord("S"))) craft_amount = clamp(craft_amount - 1, 1, max_amount);
	var d = instance_create_layer(0, 0, "GUI", obj_dialogue)
	
}