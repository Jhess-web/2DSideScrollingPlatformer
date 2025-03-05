/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 703F0E8B
/// @DnDArgument : "expr" "jump_speed*1.5"
/// @DnDArgument : "var" "jump_speed"
jump_speed = jump_speed*1.5;

/// @DnDAction : YoYo Games.Instances.Destroy_Instance
/// @DnDVersion : 1
/// @DnDHash : 69DB8E49
/// @DnDApplyTo : {Obj_jump}
with(Obj_jump) instance_destroy();

/// @DnDAction : YoYo Games.Particles.Effect
/// @DnDVersion : 1
/// @DnDHash : 0D1A4CA3
/// @DnDArgument : "x_relative" "1"
/// @DnDArgument : "y_relative" "1"
/// @DnDArgument : "size" "1"
/// @DnDArgument : "color" "$FF0000FF"
effect_create_below(0, x + 0, y + 0, 1, $FF0000FF & $ffffff);