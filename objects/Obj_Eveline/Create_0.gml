	/// @description Inisialisasi Data NPC

	// --- Pastikan global recipes SUDAH ADA ---

	// 1. DATA DIALOG
	pager = false;
	dialog_lines = [ 
		"",
	    "Halo, mau beli apa",
		"terimaksih"
	];
	mask_index   = Sprite175; 
	bwa=false;
	icon_inst = noone;
	is_blocked = false;
	kanan= anak_penjual_kanan;
	kiri= anak_penjual_kiri;
	atas= anak_penjual_atas;
	bawah= anak_penjual_bawah;
	sprite_index = bawah
	npc_path = [{ x: 736, y: 384, type: "jalan" }, { x: 800, y: 384, type: "jalan" }, { x: 800, y: 224, type: "jalan" },  { x: 768, y: 224, type: "stop" }, { x: 800, y: 224, type: "jalan" }, { x: 800, y: 384, type: "jalan" }, { x: 736, y: 544, type: "stop" } ];
	npc_index = 0;
	idle = "";
	npc_speed = 2;
	collision_area = instance_create_layer(x, y, layer, obj_interasi_collision);
	collision_area.parent_npc = id
	bergerak = false;
	rentan = false;
	talk = false;
	if(irandom(1) == 1) bergerak =true;
	punya_pesanan = false;
	selesai = false;
	pesanan = -1;
	jeda_dialog = false;
	is_paused = false;    // apakah NPC sedang berhenti
	pause_condition = false; // kondisi yang bikin NPC pergi
	pause_timer = 0;      // opsional, jika mau berhenti beberapa detik
	dialog_index = 0;

	// 3. DATA KARAKTER
	char_name = "Eveline"; 
	spr_npc_portrait = asset_get_index("anak_penjual_wajah");