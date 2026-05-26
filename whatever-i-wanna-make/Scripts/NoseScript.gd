extends Area2D

var clicks = 0

func _ready():
	$"../ClickCount".text = "Noses: 0"

func _process(delta):
	position = get_viewport_rect().size / 2

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		clicks += 1
		$"../ClickCount".text = str("Noses: ", clicks)
		$ClickAudio.play()

		var tween = create_tween()
		tween.tween_property(self, "scale", Vector2(0.95, 0.95), 0.05)
		tween.tween_property(self, "scale", Vector2(1.1, 1.1), 0.08)

func _on_mouse_entered() -> void:
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(1.1, 1.1), 0.08)

func _on_mouse_exited() -> void:
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(1.0, 1.0), 0.08)
