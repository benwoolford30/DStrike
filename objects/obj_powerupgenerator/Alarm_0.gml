/// @description Insert description here
// You can write your code in this editor
var item=irandom(4-1)+1;
switch (item)
{
	case 1:{	//speedup
	item=obj_speedup;
	}break;
	case 2:{	//healthup
	item=obj_healthup;
	}break;
	case 3:{	//invincible
	item=obj_invincible;
	}break;
	case 4:{	//attackup
	item=obj_attackup;
	}break;
}
instance_create_depth(obj_stage.bbox_left+irandom(obj_stage.bbox_right-obj_stage.bbox_left),irandom(obj_game.height/3),depth-1,item);
alarm[0]=room_speed*10;