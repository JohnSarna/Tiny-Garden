function calculate_sway(_offset_max, _sway_max, _sway_speed, _x, _y){
	cell_size = 8;
	var sway = _sway_max * sin(current_time / 1000 * _sway_speed + ((_x * _y) / 5000) + ((_x - _y) / 1000) + ((_y - _x) / 500));
	sway += (x * y) % _offset_max - (_offset_max / 2);
	return sway;
}