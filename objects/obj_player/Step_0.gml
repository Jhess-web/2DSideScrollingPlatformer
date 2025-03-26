/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 6B784A8D
/// @DnDComment : 1 would be pressing right$(13_10)-1 would be pressing left$(13_10)0 would be no input
/// @DnDDisabled : 1
/// @DnDArgument : "expr" "keyboard_check(vk_right)-keyboard_check(vk_left)"
/// @DnDArgument : "var" "move_x"


/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 04F2EEC8
/// @DnDArgument : "expr" "keyboard_check(vk_left)||(gamepad_button_check(0,gp_padl)||(gamepad_axis_value(0,gp_axislh)<-0.2))"
/// @DnDArgument : "var" "controls_input_left"
controls_input_left = keyboard_check(vk_left)||(gamepad_button_check(0,gp_padl)||(gamepad_axis_value(0,gp_axislh)<-0.2));

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 2C15B3E4
/// @DnDArgument : "expr" "keyboard_check(vk_right)||(gamepad_button_check(0,gp_padr)||(gamepad_axis_value(0,gp_axislh)>0.2))"
/// @DnDArgument : "var" "controls_input_right"
controls_input_right = keyboard_check(vk_right)||(gamepad_button_check(0,gp_padr)||(gamepad_axis_value(0,gp_axislh)>0.2));

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 4E3B0DE3
/// @DnDArgument : "expr" "controls_input_right-controls_input_left"
/// @DnDArgument : "var" "move_x"
move_x = controls_input_right-controls_input_left;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 10472951
/// @DnDArgument : "expr" "move_x*walk_speed"
/// @DnDArgument : "var" "move_x"
move_x = move_x*walk_speed;

/// @DnDAction : YoYo Games.Miscellaneous.Debug_Show_Message
/// @DnDVersion : 1
/// @DnDHash : 6B1503BF
/// @DnDArgument : "msg" "move_x"
show_debug_message(string(move_x));

/// @DnDAction : YoYo Games.Collisions.If_Object_At
/// @DnDVersion : 1.1
/// @DnDHash : 4ECAF6F6
/// @DnDComment : If we are on Ground
/// @DnDArgument : "x_relative" "1"
/// @DnDArgument : "y" "2"
/// @DnDArgument : "y_relative" "1"
/// @DnDArgument : "object" "collision_tilemap"
var l4ECAF6F6_0 = instance_place(x + 0, y + 2, [collision_tilemap]);
if ((l4ECAF6F6_0 > 0))
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 587D5668
	/// @DnDComment : Reset the falling speed $(13_10)on movement Y$(13_10)when you land on ground
	/// @DnDParent : 4ECAF6F6
	/// @DnDArgument : "var" "move_y"
	move_y = 0;

	/// @DnDAction : YoYo Games.Mouse & Keyboard.If_Key_Pressed
	/// @DnDVersion : 1
	/// @DnDHash : 40DEDB22
	/// @DnDParent : 4ECAF6F6
	var l40DEDB22_0;
	l40DEDB22_0 = keyboard_check_pressed(vk_space);
	if (l40DEDB22_0)
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 4ABD9D83
		/// @DnDComment : Jump!
		/// @DnDParent : 40DEDB22
		/// @DnDArgument : "expr" "-jump_speed"
		/// @DnDArgument : "var" "move_y"
		move_y = -jump_speed;
	
		/// @DnDAction : YoYo Games.Audio.Play_Audio
		/// @DnDVersion : 1.1
		/// @DnDHash : 00CF7066
		/// @DnDParent : 40DEDB22
		/// @DnDArgument : "soundid" "Jump"
		/// @DnDSaveInfo : "soundid" "Jump"
		audio_play_sound(Jump, 0, 0, 1.0, undefined, 1.0);
	}

	/// @DnDAction : YoYo Games.Gamepad.If_Gamepad_Button_Pressed
	/// @DnDVersion : 1.1
	/// @DnDHash : 716EF7B1
	/// @DnDParent : 4ECAF6F6
	/// @DnDArgument : "btn" "gp_face1"
	var l716EF7B1_0 = 0;
	var l716EF7B1_1 = gp_face1;
	if(gamepad_is_connected(l716EF7B1_0) && gamepad_button_check_pressed(l716EF7B1_0, l716EF7B1_1))
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 7B64CA69
		/// @DnDComment : Jump!
		/// @DnDParent : 716EF7B1
		/// @DnDArgument : "expr" "-jump_speed"
		/// @DnDArgument : "var" "move_y"
		move_y = -jump_speed;
	
		/// @DnDAction : YoYo Games.Audio.Play_Audio
		/// @DnDVersion : 1.1
		/// @DnDHash : 32793EAB
		/// @DnDParent : 716EF7B1
		/// @DnDArgument : "soundid" "Jump"
		/// @DnDSaveInfo : "soundid" "Jump"
		audio_play_sound(Jump, 0, 0, 1.0, undefined, 1.0);
	}
}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 449BD7B1
/// @DnDComment : if you're not on ground
else
{
	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 6FADA27C
	/// @DnDComment : if we are falling$(13_10)after a jump
	/// @DnDParent : 449BD7B1
	/// @DnDArgument : "var" "move_y"
	/// @DnDArgument : "op" "1"
	/// @DnDArgument : "value" "10"
	if(move_y < 10)
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 1F996B20
		/// @DnDComment : add gravity
		/// @DnDParent : 6FADA27C
		/// @DnDArgument : "expr" "2.5"
		/// @DnDArgument : "expr_relative" "1"
		/// @DnDArgument : "var" "move_y"
		move_y += 2.5;
	}
}

/// @DnDAction : YoYo Games.Movement.move_and_collide
/// @DnDVersion : 1
/// @DnDHash : 79D703EE
/// @DnDComment : 1st object is$(13_10)the object to avoid
/// @DnDArgument : "xvel" "move_x"
/// @DnDArgument : "yvel" "move_y"
/// @DnDArgument : "maxxmove" "walk_speed"
/// @DnDArgument : "maxymove" "jump_speed"
/// @DnDArgument : "object" "collision_tilemap"
move_and_collide(move_x, move_y, collision_tilemap,4,0,0,walk_speed,jump_speed);

/// @DnDAction : YoYo Games.Collisions.If_Object_At
/// @DnDVersion : 1.1
/// @DnDHash : 0D945852
/// @DnDArgument : "x_relative" "1"
/// @DnDArgument : "y" "2"
/// @DnDArgument : "y_relative" "1"
/// @DnDArgument : "object" "collision_Temp_Tiles_death_zone"
var l0D945852_0 = instance_place(x + 0, y + 2, [collision_Temp_Tiles_death_zone]);
if ((l0D945852_0 > 0))
{
	/// @DnDAction : YoYo Games.Rooms.Restart_Room
	/// @DnDVersion : 1
	/// @DnDHash : 35ABC7E5
	/// @DnDParent : 0D945852
	room_restart();
}