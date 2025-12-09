function cutscene_start(index) {
    cutscene_active = true;
    current_story = index;
    current_step = 0;

    // Lock player movement
    global.player_locked = true;
}
