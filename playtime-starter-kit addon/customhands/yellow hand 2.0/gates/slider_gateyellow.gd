extends StaticBody3D

@onready var animation_player: AnimationPlayer = $AnimationPlayer



func _on_hand_grab_grabbed(hand: bool) -> void:
	if not Grabpack.right_hand.current_hand_node.name == "YellowHand":
		Grabpack.right_retract()
		Grabpack.left_retract()
	else:
		if hand and Grabpack.right_hand.current_hand_node.name == "YellowHand":
			$Jumped.play()
			animation_player.play("open")
			$HandGrab.enabled = false
			Grabpack.right_retract()
