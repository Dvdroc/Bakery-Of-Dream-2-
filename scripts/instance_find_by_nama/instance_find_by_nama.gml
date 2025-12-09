function instance_find_by_nama(nama) {
    var inst = noone;

    with (obj_interaktif) {
        if (my_name == nama) {
            inst = id;
        }
    }

    return inst;
}
