extends Node2D

const libelulas = preload("res://libelulas/libelulas.tscn")

func _on_timer_timeout() -> void:
	var libelula = libelulas.instantiate()
	var x = randf_range(-50, -10)
	var y = randf_range(0, 400)
	libelula.position = Vector2(x, y)
	add_child(libelula)
