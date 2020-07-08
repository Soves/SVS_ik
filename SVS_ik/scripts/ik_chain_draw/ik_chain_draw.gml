///update ik chain to face target
//returns updated chain

///@arg chain
var _xpos = 0,
	_ypos = 1,
	_len = 2,
	_nProps = 3,
	_startN = 4;

var _chain = argument0,
	_size = array_length_1d(_chain);

//draw loop
for(var _i = _startN; _i < _size-_nProps; _i+=_nProps){
	
	draw_line( _chain[_i+_xpos], _chain[_i+_ypos],
		_chain[_i+_xpos+_nProps],
		_chain[_i+_ypos+_nProps]);
	
}

draw_line( _chain[2], _chain[3],
		_chain[_size-_nProps+_xpos],
		_chain[_size-_nProps+_ypos]);