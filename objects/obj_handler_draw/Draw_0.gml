// Sun Angle
shadow_rotation = 130;

// Calculate depth order
calculate_depth(depth_order);

// Clear surfaces
surface_set_target(surface_shadow);
draw_clear_alpha(c_black, 0);
surface_reset_target();
surface_set_target(surface_instance);
draw_clear_alpha(c_black, 0);
surface_reset_target();

// Draw surface_ground before everything else
draw_surface(surface_ground, 0, 0);

// Draw each instance in depth_order to surface_instance
for (var i=0; i<array_length(depth_order); i++) {
	
	// Reset drawing modes
	draw_set_color(c_white);
	draw_set_alpha(1);
	var instance_alpha = 1.0;
	var shadow_alpha = 0.4;
	var shadow_length = 1.75;
	var sway_speed = 2;
	
	with (depth_order[i]) {		
		// Set sprite rotation offset
		var sprite_rotation_offset = 0;
		
		switch (object_index) {
			case obj_instance_player:
				// Player draw properties
				shadow_alpha = 0.5;
			break;
			case obj_instance_tree:
				// Tree draw properties
				sprite_rotation_offset = calculate_sway(20, 2, sway_speed, x, y);
				instance_alpha = 0.90;
				shadow_alpha = 0.5;
			break;
			case obj_instance_bush:
				//Bush draw properties
				sprite_rotation_offset = calculate_sway(10, 5, sway_speed, x, y);
				instance_alpha = 0.8;
			break;
			case obj_instance_pebble:
				// Pebble draw properties
				sprite_rotation_offset = calculate_sway(40, 0, 0, x, y);
				instance_alpha = 0.85;
				shadow_alpha = 0.6;
			break;
			case obj_instance_tallgrass:
				// Tallgrass draw properties
				sprite_rotation_offset = calculate_sway(5, 20, sway_speed, x, y);
				instance_alpha = 0.8;
			break;
			case obj_instance_twig:
				// Twig draw properties
				sprite_rotation_offset = calculate_sway(10, 10, sway_speed, x, y);
				instance_alpha = 0.75;
			break;
		}
		// Draw shadow to surface_shadow
		surface_set_target(other.surface_shadow);
		draw_sprite_ext(object_get_sprite(object_index), image_index, x, y, 1, shadow_length, other.shadow_rotation + sprite_rotation_offset, c_black, shadow_alpha);
		surface_reset_target();
		
		// Draw instance to surface_instance
		surface_set_target(other.surface_instance);
		draw_sprite_ext(object_get_sprite(object_index), image_index, x, y, 1, 1, sprite_rotation_offset, c_white, instance_alpha);
		surface_reset_target();
	}
}

// Draw surface_shadow and surface_instance
draw_surface(surface_shadow, 0, 0);
draw_surface(surface_instance, 0, 0);

//Draw a circle at every instance
//draw_set_alpha(0.25)
//for (var i=0; i<array_length(depth_order); i++) {
//	draw_circle(depth_order[i].x, depth_order[i].y, 0.5, false);
//}
//draw_set_alpha(1.0);

// Draw hitboxes around instances
//draw_set_alpha(0.25)
//for (var i=0; i<array_length(depth_order); i++) {
//	with (depth_order[i]) {
//		draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
//	}
//}
//draw_set_alpha(1.0);