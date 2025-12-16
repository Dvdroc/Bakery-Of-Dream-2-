function scr_load_game(_filename) {
    if (file_exists(_filename)) {
        var _file = file_text_open_read(_filename);
        var _json = file_text_read_string(_file);
        file_text_close(_file);

        var _data = json_parse(_json);

        // Restore Data
        global.gold = _data.gold;
        global.reputation = _data.reputation;
        global.day = _data.day;
        global.time_of_day = _data.time_of_day;
        global.musim = _data.musim;
        global.stamina = _data.stamina;
        global.recipes = _data.recipes;

        // Restore Inventory
        ds_map_clear(global.inventory);
        var _inv_struct = _data.inventory_data;
        var _names = variable_struct_get_names(_inv_struct);
        for (var i = 0; i < array_length(_names); i++) {
            ds_map_add(global.inventory, _names[i], variable_struct_get(_inv_struct, _names[i]));
        }
        
        return true;
    }
    return false;
}