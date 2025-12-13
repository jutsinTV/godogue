class_name InventoryMenu
extends CanvasLayer

signal item_selected(item)

const inventory_menu_item_scene := preload("res://src/GUI/InventoryaMenu/inventory_menu_item.tscn")

@onready var inventory_list: VBoxContainer = $"%InventoryList"
@onready var title_label: Label = $"%TitleLabel"

func _ready() -> void:
	hide()

func button_pressed(item: Entity = null) -> void:
	item_selected.emit(item)
	queue_free()

func _register_item(index: int, item: Entity) -> void:
	var item_button: Button = inventory_menu_item_scene.instantiate()
	var char: String = String.chr("a".unicode_at(0) + index)
	item_button.text = "( %s ) %s" % [char, item.get_entity_name()]
	var shortcut_event := InputEventKey.new()
	shortcut_event.keycode = KEY_A + index
	item_button.shortcut = Shortcut.new()
	item_button.shortcut.events = [shortcut_event]
	item_button.pressed.connect(button_pressed.bind(item))
	inventory_list.add_child(item_button)
