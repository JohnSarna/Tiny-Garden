// Keyboard inputs for movement
var key_right = keyboard_check(ord("D"));
var key_left = keyboard_check(ord("A"));
var key_down = keyboard_check(ord("S"));
var key_up = keyboard_check(ord("W"));

var move_x = (key_right - key_left) * move_spd;
var move_y = (key_down - key_up) * move_spd;

// Collision
if (place_meeting(x+move_x, y, obj_instance_parent_collision)) {
	while (!place_meeting(x+sign(move_x), y, obj_instance_parent_collision)) {
		x += sign(move_x);
	}
	move_x = 0;
}
if (place_meeting(x, y+move_y, obj_instance_parent_collision)) {
	while (!place_meeting(x, y+sign(move_y), obj_instance_parent_collision)) {
		y += sign(move_y);
	}
	move_y = 0;
}

x += move_x;
y += move_y;

x = max((bbox_right-bbox_left)/2, x);
y = max((bbox_bottom-bbox_top), y);
x = min(room_width-(bbox_right-bbox_left)/2, x);
y = min(room_height, y);

if (move_x != 0 || move_y != 0) {
	image_speed = room_speed/60/(((1/move_spd)/10)*4);
} else {
	image_speed = 0;
	image_index = 0;
}