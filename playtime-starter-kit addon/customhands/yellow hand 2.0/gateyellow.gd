extends Node3D

@onready var Hand = $yellow2/HandGrab

func _on_hand_grab_grabbed(hand):
	$AnimationPlayer.play("new_animation")
	Hand.enabled = false
