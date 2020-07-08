if mouse_check_button(mb_left){
	targetx = mouse_x;
	targety = mouse_y;
}else{

	targetx = x-1;
	targety = y-30*10;
	
	
}
vertex_delete_buffer(vBuff);
chain = ik_chain_get_blend(chain, target_chain, .2);
vBuff = ik_chain_build_cone(chain,buff, cw);
