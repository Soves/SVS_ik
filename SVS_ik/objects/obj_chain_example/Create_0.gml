ik_init();

target_chain = ik_create_chain( x, y);
chain = ik_create_chain( x, y);

repeat(3){
ik_chain_add_segment( chain, 20);
ik_chain_add_segment( target_chain, 20);
}

show_debug_overlay(true);

cw = irandom_range(4,14);

buff = ik_chain_cache_buffer( chain);
vBuff = ik_chain_build_cone(chain,buff, cw);

targetx = x-1;
targety = y-1;

ik_chain_get_update(chain, targetx, targety, true, x, y);
ik_chain_get_update(target_chain, targetx, targety, true, x, y);

alarm[0] = 5;