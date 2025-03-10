/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 6E61EC5B
/// @DnDArgument : "expr" "walk_speed*3"
/// @DnDArgument : "var" "walk_speed"
walk_speed = walk_speed*3;

/// @DnDAction : YoYo Games.Instances.Destroy_Instance
/// @DnDVersion : 1
/// @DnDHash : 418B9F18
/// @DnDApplyTo : {obj_speed}
with(obj_speed) instance_destroy();

/// @DnDAction : YoYo Games.Particles.Effect
/// @DnDVersion : 1
/// @DnDHash : 689F4080
/// @DnDArgument : "x_relative" "1"
/// @DnDArgument : "y_relative" "1"
/// @DnDArgument : "type" "5"
/// @DnDArgument : "size" "1"
/// @DnDArgument : "color" "$FFF8FF38"
effect_create_below(5, x + 0, y + 0, 1, $FFF8FF38 & $ffffff);