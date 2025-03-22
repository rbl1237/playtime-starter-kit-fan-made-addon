extends Node3D

@onready var red = $"Mesh/red hand"
@onready var interaction = $Mesh/BasicInteraction
@onready var label1 = $Label3D
@onready var label2 = $Label3D2
@onready var label3 = $Label3D3
@onready var label4 = $Label3D4
@onready var timer = $Timer
@onready var itemhand = $Mesh2

func _ready():
	itemhand.visible = false
	red.visible = false
	interaction.visible = true
	label1.visible = true
	label2.visible = false
	label3.visible = false
	label4.visible = false
	$Mesh/BasicInteraction.visible = false


func _on_keycard_reader_inserted():
	$AnimationPlayer.play("keycard inserted")
	label1.visible = false
	label2.visible = true
	$Mesh/BasicInteraction.visible = true


func _on_basic_interaction_player_interacted():
	timer.start()
	$Scanning.play()
	$AnimationPlayer.play("hand upgrader")
	red.visible = true
	interaction.visible = false
	Grabpack.remove_hand("RedHand")
	label4.visible = true
	label3.visible = true
	label2.visible = false
	
func _on_timer_timeout():
	itemhand.visible = true
