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