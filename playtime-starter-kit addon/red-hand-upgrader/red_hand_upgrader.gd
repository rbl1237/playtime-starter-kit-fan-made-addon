extends Node3D

@onready var red = $"Mesh/red hand"
@onready var interaction = $Mesh/BasicInteraction
@onready var label1 = $Label3D
@onready var label2 = $Label3D2
@onready var label3 = $Label3D3
@onready var label4 = $Label3D4

func _ready():
	red.visible = false
	interaction.visible = true
	label1.visible = true
	label2.visible = false
	label3.visible = false
	label4.visible = false


func _on_keycard_reader_inserted():
	$AnimationPlayer.play("keycard inserted")
	label1.visible = false
	label2.visible = true


func _on_basic_interaction_player_interacted():
	$Scanning.play()
	$AnimationPlayer.play("hand upgrader")
	red.visible = true
	interaction.visible = false
	Grabpack.remove_hand("RedHand")
	label4.visible = true
	label3.visible = true
	label2.visible = false
