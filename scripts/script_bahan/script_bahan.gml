// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function script_bahan(recipe_index){	
    //Buat kotak dialog baru (input jumlah)
	if(is_crafting_input){
    var d3 = instance_create_layer(0, 0, "GUI", obj_dialogue);
	d3.is_crafting_input = true;
	d3.craft_amount = 1;
	d3.recipe_index = recipe_index;
	d3.dialogue_active = true;
	d3.list_type = "bahan"
	}else if(is_buy_input){
		var d3 = instance_create_layer(0, 0, "GUI", obj_dialogue);
		d3.is_buy_input = true;
		d3.craft_amount = 1;
		d3.recipe_index = recipe_index;
		d3.dialogue_active = true;
		d3.list_type = "bahan"
	}
    // 5. Kunci dialog agar tidak langsung buka lagi
    global.dialog_open = true;
}