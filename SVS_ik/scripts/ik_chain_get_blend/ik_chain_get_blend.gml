///update ik chain to face target
//returns new blended chain

//fixed means locking the chain to the root

///@arg chain
///@arg target_chain
///@arg amount

var _chain = argument0,
	_chain2 = argument1,
	_amount = argument2,
	_size = array_length_1d(_chain);

var _xpos = 0,
	_ypos = 1,
	_len = 2,
	_nProps = 3,
	_startN = 4;

var _i = _startN;
_chain[2] = lerp(_chain[2],_chain2[2],_amount);
_chain[3] = lerp(_chain[3],_chain2[3],_amount);

var _count = (_size-_startN)/_nProps;
repeat(_count){ //Blend chains

	_chain[_i+_xpos] = lerp(_chain[_i+_xpos],_chain2[_i+_xpos],_amount);
	_chain[_i+_ypos] = lerp(_chain[_i+_ypos],_chain2[_i+_ypos],_amount);
	
	_i+=_nProps;
}

return _chain;