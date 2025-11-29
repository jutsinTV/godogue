class_name FighterComponent
extends Component

var max_hp: int
var hp: int:
	set(value):
		hp = clampi(value, 0, max_hp)
var defense: int
var power: int

func _init(definition: FighterComponentDefinition) -> void:
	max_hp = definition.max_hp
	hp = definition.max_hp
	defense = definition.defense
	power = definition.power
