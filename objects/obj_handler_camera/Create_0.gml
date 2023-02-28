// Create camera that will follow the player
var zoom = 13; // ---- Zoom ----
				// 10 -> 1.0x Zoom
				// 15 -> 1.5x Zoom
				// 20 -> 2.0x Zoom
camera = camera_create_view(0, 0, display_get_width() / zoom, display_get_height() / zoom);
view_set_camera(view_camera[0], camera);

// Initialize camera position
var player = obj_instance_player;
var cam_new_x = player.x - (camera_get_view_width(camera) / 2);
var cam_new_y = player.y - (camera_get_view_height(camera) / 2) - (sprite_get_height(object_get_sprite(player)) / 2);
camera_set_view_pos(camera, cam_new_x, cam_new_y);