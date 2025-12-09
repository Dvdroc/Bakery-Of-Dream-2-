

var bgm_asset = noone;

// === Cek malam ===
if (global.is_night) {
    bgm_asset = KleptoLindaCavernsA_Loopable;
}
else {
    switch(room)
    {
        case toko_dalam: bgm_asset = KleptoLindaMountainB_Loopable; break;
        case Room6:      bgm_asset = VictoryLap_Loopable; break;
        case Room4:      bgm_asset = UntitledTrack01_Loopable; break;
        case GUI:        bgm_asset = KleptoLindaMountainA_Loopable; break;
        case challager:  bgm_asset = KleptoLindaTitles_Loopable; break;
        case Start:      bgm_asset = KleptoLindaMountainA_Loopable; break;
    }
}

// ================================
// Kalau asset sama → JANGAN play
// ================================
if (bgm_asset == current_bgm_asset) exit;

// ========== STOP BGM LAMA ==========
if (current_bgm != -1)
{
    audio_stop_sound(current_bgm);
}

// ========== PLAY BGM BARU ==========
if (bgm_asset != noone)
{
    current_bgm = audio_play_sound(bgm_asset, 1, true);
    current_bgm_asset = bgm_asset;
}
