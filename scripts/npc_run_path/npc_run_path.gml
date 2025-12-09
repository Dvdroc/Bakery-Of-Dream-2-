function npc_run_path(name, path) {
    var inst = instance_find_by_nama(name);
    if (inst == noone) exit;

    with (inst) {
        // Jalankan path step by step
        if (path_step < array_length(path)) {
            var p = path[path_step];

            move_towards_point(p.x, p.y, 2);

            if (point_distance(x, y, p.x, p.y) < 4) {
                path_step++;

                if (p.type == "stop") speed = 0;
            }
        }
    }
}
