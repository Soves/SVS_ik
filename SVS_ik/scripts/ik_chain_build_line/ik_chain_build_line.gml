///RETURNS VERTEX BUFFER pr_triangle_strip

///@arg chain
///@arg buff
///@arg width

var _buff = argument1;

	var _xpos = 0,
		_ypos = 1,
		_len = 2,
		_nProps = 3,
		_startN = 4;

	var _chain = argument0,
		_size = array_length_1d(_chain)
		,_w = argument2;
		
	buffer_seek(_buff, buffer_seek_start, 0);
	//draw loop
	var _dir;
	//for(var _i = _startN; _i < _size-_nProps; _i+=_nProps){
	var _i = _startN;
	var _xx, _yy;
	repeat((_size-_startN-_nProps)/_nProps){
		_xx = _chain[_i+_xpos];
		_yy = _chain[_i+_ypos];
		buffer_write(_buff, buffer_f32, _xx-(_chain[_i+_ypos+_nProps]-_yy)/_chain[_i+_len]*_w); //get perpedicullar vectors
		buffer_write(_buff, buffer_f32, _yy);
		buffer_seek(_buff, buffer_seek_relative, 4);
		buffer_write(_buff, buffer_f32, _xx);
		buffer_write(_buff, buffer_f32, _yy-(_chain[_i+_xpos+_nProps]-_xx)/_chain[_i+_len]*_w);
		buffer_seek(_buff, buffer_seek_relative, 4);
		
		_i+=_nProps;
	}
	
	
	buffer_write(_buff, buffer_f32, _chain[2]);
	buffer_write(_buff, buffer_f32, _chain[3]);
	buffer_seek(_buff, buffer_seek_relative, 4);
	buffer_write(_buff, buffer_f32, _chain[_size-_nProps+_xpos]);
	buffer_write(_buff, buffer_f32, _chain[_size-_nProps+_ypos]);
	buffer_seek(_buff, buffer_seek_relative, 4);

var _vbuff = vertex_create_buffer_from_buffer(_buff,global.ikFormat);
vertex_freeze(_vbuff);
return _vbuff;