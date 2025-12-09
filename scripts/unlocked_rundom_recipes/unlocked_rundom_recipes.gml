function unlocked_rundom_recipes(){
	var locked_recipes = [];

    // cari resep yang masih locked
    for (var i = 0; i < array_length(global.recipes); i++) {
        if (global.recipes[i].unlocked == false) {
            array_push(locked_recipes, i); // simpan index
        }
    }

    // jika ada yang locked
    if (array_length(locked_recipes) > 0) {
        var pick = irandom(array_length(locked_recipes) - 1);
        var real_index = locked_recipes[pick];

        // buka resep
        global.recipes[real_index].unlocked = true;
		var d2 = instance_create_layer(0, 0, "GUI", obj_dialogue);
		d2.box_x = 227;
		d2.box_y = 150;
		d2.box_width = 400;
		d2.dialogue_text = "Resep baru terbuka " +  string( global.recipes[real_index].name) ;
		d2.draw_text_display = " ";
        d2.dialogue_active = true;
		d2.dynamic_height = true;
    } 
}