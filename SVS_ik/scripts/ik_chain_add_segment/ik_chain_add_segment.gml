///ADDS A SEGMENT TO IK CHAIN
///returns id of segment

var _xpos = 0,
	_ypos = 1,
	_len = 2;

///@arg chain
///@arg length

var _chain = argument0,
	_length = argument1,
	_offset = array_length_1d(_chain);
	
_chain[@ _offset+_xpos] = _chain[_xpos]; //x
_chain[@ _offset+_ypos] = _chain[_ypos]; //y
_chain[@ _offset+_len] = _length; //length

_chain[@ _len] += _length; //add to total length of chain

return _offset;