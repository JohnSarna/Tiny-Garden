// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function calculate_ground_color(_x, _y, _color_smoothing){
	var _coord = (_x * (room_height - _y)) / (room_width * room_height);
	var _rand = random(0.2);
	_coord += _rand - (_rand / 2);
		
	var _hue1 = 340 * (255 / 359);
	var _hue2 = 370 * (255 / 359);
	var _hue_mix = ((_hue1 + ((_hue2 - _hue1) * _coord)) div _color_smoothing) * _color_smoothing;
		
	var _sat1 = 38 * 2.55;
	var _sat2 = 36 * 2.55;
	var _sat_mix = ((_sat1 + ((_sat2 - _sat1) * _coord)) div _color_smoothing) * _color_smoothing;
		
	var _val1 = 34 * 2.55;
	var _val2 = 58 * 2.55;
	var _val_mix = ((_val1 + ((_val2 - _val1) * _coord)) div _color_smoothing) * _color_smoothing;
		
	var _col = make_color_hsv(_hue_mix, _sat_mix, _val_mix);
	
	return _col;
}