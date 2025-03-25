extends Node3D

@onready var A = $CSGBox3D49/CSGBox3D50
@onready var B = $CSGBox3D49/CSGBox3D51
@onready var C = $CSGBox3D49/CSGBox3D52
@onready var D = $CSGBox3D49/CSGBox3D53
@onready var handp = $CSGBox3D49/MeshInstance3D

func _ready():
	A.visible = false
	B.visible = false
	D.visible = false
	C.visible = false
	handp.visible = true

func _on_hand_grab_grabbed(hand):
	if hand and Grabpack.right_hand.current_hand_node.name == "CyanHand":
		A.visible = true
		B.visible = true
		D.visible = true
		C.visible = true
		handp.visible = false
		$HandGrab.enabled = false
