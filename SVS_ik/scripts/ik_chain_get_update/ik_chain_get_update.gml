///update ik chain to face target
//returns updated chain

//fixed means locking the chain to the root

///@arg chain
///@arg targetx
///@arg targety
///@arg fixed
///@arg x
///@arg y

var _chain = argument0,
	_size = array_length_1d(_chain);
	
_chain[0] = argument4;
_chain[1] = argument5;

var _xpos = 0,
	_ypos = 1,
	_len = 2,
	_nProps = 3,
	_startN = 4;

var _targx = argument1,
	_targy = argument2;
	
var _fixed = argument3;

//update first seg to face target

var _i = _size-_nProps;

var _dx, _dy, _coeff;

_dx = _chain[_i+_xpos] - _targx;
_dy = _chain[_i+_ypos] - _targy;
_coeff = _chain[_i+_len]/sqrt(_dx*_dx + _dy*_dy);
_chain[_i+_xpos] = _targx + _coeff*_dx;
_chain[_i+_ypos] = _targy + _coeff*_dy;

//set pointy end
_chain[2] = _targx + _coeff;
_chain[3] = _targy + _coeff;

//do ik on the rest
var _i = _size-_nProps*2;
repeat((_size-_startN-_nProps)/_nProps){
//for(_i = _size-_nProps*2; _i >= _startN; _i-=_nProps){
	
	_dx = _chain[_i+_xpos] - _chain[_i+_xpos+_nProps];
	_dy = _chain[_i+_ypos] - _chain[_i+_ypos+_nProps];
	_coeff = _chain[_i+_len]/sqrt(_dx*_dx + _dy*_dy);
	_chain[_i+_xpos] = _chain[_i+_xpos+_nProps] + _coeff*_dx;
	_chain[_i+_ypos] = _chain[_i+_ypos+_nProps] + _coeff*_dy;
	_i-=_nProps;
	
}

//move everything back
if _fixed{
	var _xdif = _chain[_xpos]-_chain[_startN+_xpos],
		_ydif = _chain[_ypos]-_chain[_startN+_ypos];

	//for(var _i = _startN; _i < _size; _i+=_nProps){
	_i = _startN;
	repeat((_size-_startN)/_nProps){
		_chain[_i+_xpos] += _xdif;
		_chain[_i+_ypos] += _ydif;
		_i+=_nProps
	}
	
	_chain[2] += _xdif;
	_chain[3] += _ydif;
}
return _chain;