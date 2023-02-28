// Create depth_order array
depth_order = array_create(0, noone);

// Sort the array
calculate_depth(depth_order);

// Create surface to handle drawing of all instances in the depth_order array
surface_shadow = surface_create(room_width, room_height);
surface_instance = surface_create(room_width, room_height);

// Create ground surface (static image)
surface_ground = surface_create(room_width, room_height);

surface_set_target(surface_ground);
for (var i=0; i<surface_get_width(surface_ground); i++) {
	for (var j=0; j<surface_get_height(surface_ground); j++) {
		var _color_smoothing = 8;
		draw_point_color(i, j, calculate_ground_color(i, j, _color_smoothing));
	}
}
surface_reset_target();