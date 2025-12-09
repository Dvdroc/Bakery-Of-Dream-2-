// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function npc_receive_order(selesai, pilihan, pesanan){
	var indeks_cocok = -1;
	var pinalti = 0;
	var salah = false
	if (global.baked_goods[pilihan].name == global.recipes[pesanan].name) {
		indeks_cocok = pilihan;
		}
	if (indeks_cocok != -1) {
		// Kurangi jumlah kue
		global.baked_goods[indeks_cocok].count -= 1;
		
		// Hapus jika count habis
		if (global.baked_goods[indeks_cocok].count <= 0) {
			array_delete(global.baked_goods, indeks_cocok, 1);
			}
			// Dialog sukses
			var d = instance_create_layer(0, 0, "GUI", obj_dialogue);
			d.dialogue_active = true;
			d.dialogue_text = "Pesanan diterima!";
			d.dialog_name = "PESANAN";
			selesai.selesai = true;
			global.combo += 1;
			global.wrong = 0;
			global.done += 1;
			with(obj_ScoreDisplay){
				rep_gain  += random_range(0.03, 0.04);
				gold_gain += global.recipes[pesanan].harga + 50
			}
			show_debug_message("combo" + string(global.combo));
			}
			else{
				// kalo nggak ada item sesuai
				var d2 = instance_create_layer(0, 0, "GUI", obj_dialogue);
		        d2.dialogue_text = "Ini Bukan kue yang aku Pesan!";
		        d2.draw_text_display = " ";
		        d2.dialogue_active = true;
				global.wrong += 1;
				pinalti = power(global.wrong, 2) * 0.5;
				with(obj_ScoreDisplay){
					rep_gain -= pinalti;
				}
				global.combo = 0;
				salah = true;
		    }
		if(salah){
			var d3 = instance_create_layer(0, 0, "GUI", obj_dialogue);
				d3.box_x = 30;
		        d3.box_y = 96;
		        d3.box_width = 300;
		        d3.dialogue_text = string(pinalti);
		        d3.dialogue_active = true;
				salah = false;
		}
}
