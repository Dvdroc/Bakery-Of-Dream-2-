if (!cutscene_active) exit;

// Ambil step story
var story = global.story[current_story];
var step = story.npc_action[current_step];

// 1. Spawn NPC jika belum ada
if (!instance_exists(obj_npc_controller)) {
    instance_create_layer(0,0,"Instances", obj_npc_controller);
}

// 2. Perintah jalan NPC
if (array_length(step.path) > 0) {
    npc_run_path(step.npc, step.path);
}

// 3. Dialog
if (keyboard_check_pressed(vk_space)) {
    show_dialog(step.dialog);

    // Setelah dialog selesai → lanjut step berikutnya
    current_step++;

    // Kalau step habis → cutscene selesai
    if (current_step >= array_length(story.npc_action)) {
        end_cutscene();
    }
}
