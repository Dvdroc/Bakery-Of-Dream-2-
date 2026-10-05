/// @description Insert description here
// You can write your code in this editor
// Status pesanan
punya_pesanan = false;
pesanan = -1;
jeda_dialog = false; // kontrol supaya dialog hanya muncul sekali
selesai = false;
npc_path = [];
npc_index = 0;
is_blocked = false;
npc_speed = 2;
idle = 1;
npc_wait = 0;
idle = "";
npc_active = false;
npc_move = false;
seated = false;
start_delay = irandom_range(10, 240);
collision_area = instance_create_layer(x, y, layer, obj_interasi_collision);
collision_area.parent_npc = id;
seated = false;         // sudah sampai tempat duduk
counted = false;
icon_inst = noone;
seated_counted = false;
show_debug_message(string(global.npc_aktiv_target));

// RANDOM: apakah NPC ini aktif
if (global.npc_aktif_count < global.npc_aktiv_target) {
    npc_move = (irandom(1) == 1);  // 50% chance aktif
    if (npc_move) global.npc_aktif_count += 1;
	
} else {
    npc_move = false;
}
// List paket sprite karakter
karakter_sprites = [
    {
        kanan: NPC_A_kanan,
        kiri: NPC_A_kiri,
        atas: NPC_A_atas,
        bawah: NPC_A_bawah
    },
    {
		kanan: NPC_B_kanan,
        kiri: NPC_B_kiri,
        atas: NPC_B_atas,
        bawah: NPC_B_bawah
    },
    {
		kanan: NPC_C_kanan,
        kiri: NPC_C_kiri,
        atas: NPC_C_atas,
        bawah: NPC_C_bawah
    },
	{
        kanan: NPC_D_kanan,
        kiri: NPC_D_kiri,
        atas: NPC_D_atas,
        bawah: NPC_D_bawah
    },
    {
		kanan: NPC_E_kanan,
        kiri: NPC_E_kiri,
        atas: NPC_E_atas,
        bawah: NPC_E_bawah
    },
    {
		kanan: NPC_F_kanan,
        kiri: NPC_F_kiri,
        atas: NPC_F_atas,
        bawah: NPC_F_bawah
    },
	{
        kanan: NPC_G_kanan,
        kiri: NPC_G_kiri,
        atas: NPC_G_atas,
        bawah: NPC_G_bawah
    },
    {
		kanan: NPC_H_kanan,
        kiri: NPC_H_kiri,
        atas: NPC_H_atas,
        bawah: NPC_H_bawah
    },
    {
		kanan: NPC_I_kanan,
        kiri: NPC_I_kiri,
        atas: NPC_I_atas,
        bawah: NPC_I_bawah
    },
	{
        kanan: NPC_J_kanan,
        kiri: NPC_J_kiri,
        atas: NPC_J_atas,
        bawah: NPC_J_bawah
    },
    {
		kanan: NPC_K_kanan,
        kiri: NPC_K_kiri,
        atas: NPC_K_atas,
        bawah: NPC_K_bawah
    },
    {
		kanan: NPC_L_kanan,
        kiri: NPC_L_kiri,
        atas: NPC_L_atas,
        bawah: NPC_L_bawah
    },
	{
        kanan: NPC_M_kanan,
        kiri: NPC_M_kiri,
        atas: NPC_M_atas,
        bawah: NPC_M_bawah
    },
    {
		kanan: NPC_N_kanani,
        kiri: NPC_N_kiri,
        atas: NPC_N_atas,
        bawah: NPC_N_bawah
    },
    {
		kanan: NPC_O_kanan,
        kiri: NPC_O_kiri,
        atas: NPC_O_atas,
        bawah: NPC_O_bawah
    },
	{
        kanan: NPC_P_kanan,
        kiri: NPC_P_kiri,
        atas: NPC_P_atas,
        bawah: NPC_P_bawah
    },
    {
		kanan: NPC_Q_kanan,
        kiri: NPC_Q_kiri,
        atas: NPC_Q_atas,
        bawah: NPC_Q_bawah
    },
    {
		kanan: NPC_R_kanan,
        kiri: NPC_R_kiri,
        atas: NPC_R_atas,
        bawah: NPC_R_bawah
    },
	{
        kanan: NPC_S_kanan,
        kiri: NPC_S_kiri,
        atas: NPC_S_atas,
        bawah: NPC_S_bawah
    },
    {
		kanan: NPC_T_kanan,
        kiri: NPC_T_kiri,
        atas: NPC_T_atas,
        bawah: NPC_T_bawah
    },
    {
		kanan: NPC_U_kanan,
        kiri: NPC_U_kiri,
        atas: NPC_U_atas,
        bawah: NPC_U_bawah
    },
	{
        kanan: NPC_V_kanan,
        kiri: NPC_V_kiri,
        atas: NPC_V_atas,
        bawah: NPC_V_bawah
    },
    {
		kanan: NPC_W_kanan,
        kiri: NPC_W_kiri,
        atas: NPC_W_atas,
        bawah: NPC_W_bawah
    },
    {
		kanan: NPC_X_kanan,
        kiri: NPC_X_kiri,
        atas: NPC_X_atas,
        bawah: NPC_X_bawah
    },
	 {
		kanan: NPC_Y_kanan,
        kiri: NPC_Y_kiri,
        atas: NPC_Y_atas,
        bawah: NPC_Y_bawah
    },
    {
		kanan: NPC_Z_kanan,
        kiri: NPC_Z_kiri,
        atas: NPC_Z_atas,
        bawah: NPC_Z_bawah
    },
	{
        kanan: NPC_A1_kanan,
        kiri: NPC_A1_kiri,
        atas: NPC_A1_atas,
        bawah: NPC_A1_bawah
    },
    {
		kanan: NPC_B1_kanan,
        kiri: NPC_B1_kiri,
        atas: NPC_B1_atas,
        bawah: NPC_B1_bawah
    },
    {
		kanan: NPC_C1_kanan,
        kiri: NPC_C1_kiri,
        atas: NPC_C1_atas,
        bawah: NPC_C1_bawah
    },
	{
        kanan: NPC_D1_kanan,
        kiri: NPC_D1_kiri,
        atas: NPC_D1_atas,
        bawah: NPC_D1_bawah
    },
    {
		kanan: NPC_E1_kanan,
        kiri: NPC_E1_kiri,
        atas: NPC_E1_atas,
        bawah: NPC_E1_bawah
    },
    {
		kanan: NPC_F1_kanan,
        kiri: NPC_F1_kiri,
        atas: NPC_F1_atas,
        bawah: NPC_F1_bawah
    }
];


// Pilih karakter random
var pilih = irandom(array_length(karakter_sprites)-1);
karakter = karakter_sprites[pilih];

// sprite awal
sprite_index = karakter.bawah;
