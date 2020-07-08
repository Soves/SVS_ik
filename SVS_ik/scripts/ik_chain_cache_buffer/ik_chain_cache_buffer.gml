///@arg chain

var _vBuff = vertex_create_buffer();

	var _xpos = 0,
		_ypos = 1,
		_len = 2,
		_nProps = 3,
		_startN = 4;

	var _chain = argument0,
		_size = array_length_1d(_chain);
		
vertex_begin(_vBuff,global.ikFormat);


	//draw loop
	for(var _i = _startN; _i < _size-_nProps; _i+=_nProps){
	
		vertex_position( _vBuff, _chain[_i+_xpos], _chain[_i+_ypos])
		vertex_color( _vBuff, c_white, 1);
		vertex_position( _vBuff, _chain[_i+_xpos+_nProps], _chain[_i+_ypos+_nProps]);
		vertex_color( _vBuff, c_white, 1);	
	
	}
	
	vertex_position( _vBuff, _chain[2], _chain[3]);
	vertex_color( _vBuff, c_white, 1);
	vertex_position( _vBuff, _chain[_size-_nProps+_xpos], _chain[_size-_nProps+_ypos]);
	vertex_color( _vBuff, c_white, 1);	

vertex_end(_vBuff);

var _buff = buffer_create_from_vertex_buffer(_vBuff, buffer_fixed, 1);
vertex_delete_buffer(_vBuff);
return _buff;