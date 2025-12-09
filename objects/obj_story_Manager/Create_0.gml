if (!variable_global_exists("story")) { 
	global.story = array_create(0);
	array_push(global.story, {
	    judul: "Prolog",

	    npc_action: [
	        {
	            npc: "Evan",
	            path: [
	                {x: 100, y: 120, type: "jalan"},
	                {x: 140, y: 120, type: "stop"}
	            ],
	            dialog: [
	                "Sudah lama sekali... Tempat ini masih sama seperti yang kuingat saat kecil."
	            ]
	        },

	        {
	            npc: "Charlie",
	            path: [
	                {x: 40, y: 200, type: "jalan"},
	                {x: 100, y: 120, type: "stop"}
	            ],
	            dialog: [
	                "Evan, akhirnya kau datang. Aku tahu kau akan kembali ke sini.",
	                "Nenekmu selalu percaya padamu..."
	            ]
	        },

	        {
	            npc: "Evan",
	            path: [],
	            dialog: [
	                "Paman Charlie! Aku... aku tidak tahu harus mulai dari mana."
	            ]
	        },

	        {
	            npc: "Narrator",
	            path: [],
	            dialog: [
	                "Dan begitulah perjalanan Evan dimulai..."
	            ]
	        }
	    ],

	    unlocked: false
	});
}