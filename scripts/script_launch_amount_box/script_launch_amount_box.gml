/// @function script_launch_amount_box(_recipe_index)
function script_launch_amount_box(recipe_index)
{
    // 1. Hapus semua dialog lama agar tidak dobe

    // 2. Buat kotak dialog baru (input jumlah)
    var d3 = instance_create_layer(500, 100, "GUI", obj_dialogue);
	if(is_crafting_input){
		d3.is_crafting_input = true;
		d3.box_x = 30;
		d3.box_y = 150;
	}else if(is_buy_input){
		d3.is_buy_input = true;
		d3.box_x = 30;
		d3.box_y = 115;
	}
	d3.recipe_index = recipe_index;
	d3.craft_amount = 1;
	d3.current_char = 999;
	d3.dialogue_active = true;
	d3.dynamic_height = true
	d3.list_type = "amount"
	d3.box_width = 300;

    // 5. Kunci dialog agar tidak langsung buka lagi
    global.dialog_open = true;
}
