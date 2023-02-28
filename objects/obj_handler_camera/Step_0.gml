// Move the camera to the player (smoothly)
var player = obj_instance_player;
var cam_current_x = camera_get_view_x(camera);
var cam_current_y = camera_get_view_y(camera);
var cam_target_x = player.x - (camera_get_view_width(camera) / 2);
var cam_target_y = player.y - (camera_get_view_height(camera) / 2) - (sprite_get_height(object_get_sprite(player)) / 2);
var cam_new_x = lerp(cam_current_x, cam_target_x, 0.1);
var cam_new_y = lerp(cam_current_y, cam_target_y, 0.1);

cam_new_x = max(0, cam_new_x);
cam_new_y = max(0, cam_new_y);

cam_new_x = min(room_width - camera_get_view_width(camera), cam_new_x);
cam_new_y = min(room_height - camera_get_view_height(camera), cam_new_y);

camera_set_view_pos(camera, cam_new_x, cam_new_y);

//---------------------------------------------------------------------------------------------------------------------
// Deactivate all foliage outside of camera bounds
// Reactivate all foliage inside of camera bound
instance_deactivate_region(0, 0, room_width, room_height, true, true);

var cam = view_camera[0];
var left = camera_get_view_x(cam);
var top = camera_get_view_y(cam);
var width = camera_get_view_width(cam);
var height = camera_get_view_height(cam);

var buffer = 1.5;			// ---------- Buffer ----------
left -= width / buffer;		// 1.0 -> extends 1.0 room widths past camera border
top -= height / buffer;		// 1.5 -> extends 0.5 room widths past camera border
width *= 3 / buffer;		// 2.0 -> extends 0.0 room widths past camera border (no buffer)
height *= 3 / buffer;

instance_activate_region(left, top, width, height, true);
instance_activate_object(obj_instance_player);