function npc_run_path(name, path) {
    var inst = instance_find_by_nama(name);
    if (inst == noone) exit;

    with (inst) {
        // Pastikan variabel path_step ada
        if (!variable_instance_exists(id, "path_step")) path_step = 0;

        // Jalankan path step by step
        if (path_step < array_length(path)) {
            var p = path[path_step];
            
            // Gerak ke titik target
            move_towards_point(p.x, p.y, 2); // Angka 2 itu speednya

            // Cek jarak, kalau dekat berarti sampai
            if (point_distance(x, y, p.x, p.y) < 4) {
                x = p.x; // Snap posisi biar pas
                y = p.y;
                path_step++; // Lanjut ke titik path berikutnya
                
                // Cek tipe gerakan
                if (p.type == "stop") {
                    speed = 0;
                }
            }
        } else {
            // Kalau path habis, pastikan berhenti total
            speed = 0;
        }
    }
}