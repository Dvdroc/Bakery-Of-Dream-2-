function end_cutscene() {
    cutscene_active = false;
    global.story[current_story].unlocked = true;

    // Player bebas lagi
    global.player_locked = false;
}
