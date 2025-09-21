extends Node3D

@onready var Hand = $yellow2/HandGrab

func _on_hand_grab_grabbed(hand):
	if hand and Grabpack.right_hand.current_hand_node.name == "YellowHand":
		$AnimationPlayer.play("new_animation")
		Hand.enabled = false
