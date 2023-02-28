// Function to ensure that no instances are spawned at the same position as another instance
var spawn_instance = function(_count, _object, _x, _y) {
	var room_area = room_width * room_height;
	var count = (_count/(192*120)) * room_area;
	var object = _object;
	for (var i=0; i<count; i++) {
		// Randomize coordinates unless coordinates are specified in arguments
		var _xx = irandom_range(0, room_width);
		var _yy = irandom_range(0, room_height);
		if (_x != undefined) {
			_xx = _x;
			_yy = _y;
		}
		
		// Get rid of the coordinate decimal points
		_xx = floor(_xx);
		_yy = floor(_yy);
		
		// Don't spawn anything around obj_instance_player
		var no_spawn_radius = 15;
		var player = obj_instance_player;
		if (_object != player && point_distance(_xx, _yy, player.x, player.y) <= no_spawn_radius) {
			continue;
		}
		
		// Spawn the instance
		if (!instance_position(_xx, _yy, obj_instance_parent_draw)) {
			instance_create_layer(_xx, _yy, "Instances", object);
		}
		
	}
} 

// Spawn all instances
spawn_instance(1, obj_instance_player, room_width/2, room_height/2);
spawn_instance(10, obj_instance_tree);
spawn_instance(10, obj_instance_bush);
spawn_instance(25, obj_instance_pebble);
spawn_instance(100, obj_instance_twig);
spawn_instance(300, obj_instance_tallgrass);