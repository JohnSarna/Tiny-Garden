function calculate_depth(_array){
	array_resize(_array, 0);
	with (obj_instance_parent_draw) {
		array_push(_array, id);
	}
	
	
	// Sort _array
	var _f = function(_inst1, _inst2) {
		return ((_inst1.y*room_height) + (_inst1.x)) - ((_inst2.y*room_height) + (_inst2.x));
	}
	array_sort(_array, _f);
}