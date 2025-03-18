extends Node3D

@onready var light = $Light
@onready var hand_normal = $Skeleton3D/hand_normal
@onready var hand_powered = $Skeleton3D/hand_powered
@onready var effect_line: Node3D = $EffectLine
@onready var effect: AnimationPlayer = $Effect
@onready var discharge: AudioStreamPlayer = $Discharge
@onready var loop: AudioStreamPlayer = $Loop

var powered: bool = false
var remaining_power: float = 0.0

const WIRE_GREEN_MATERIAL = preload("res://Player/Grabpack/Wire/WireGreenMaterial.tres")

func _ready():
	set_power(false)

func _process(delta):
	if remaining_power > 0.0:
		remaining_power -= 1.0 * delta
	else:
		if powered:
			discharge.play()
			set_power(false)

func set_power(power: bool):
	loop.playing = power
	light.visible = power
	hand_normal.visible = !power
	hand_powered.visible = power
	effect_line.visible = power
	if power: Grabpack.power_wire(WIRE_GREEN_MATERIAL, true, true)
	else: Grabpack.dispower_wire(true, true)
	if not power:
		remaining_power = 0.0
	powered = power
	if power:
		effect.play("powered")
	else:
		effect.stop()
