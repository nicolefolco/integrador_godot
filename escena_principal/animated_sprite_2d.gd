extends AnimatedSprite2D

var estado_actual = "idle"
var boton_apretado = false
var contador_clicks_golpear = 0 

func _ready() -> void:
	play("idle")

func estado_personaje(unEstado):
	estado_actual = unEstado

func animacion_idle():
	play("idle")
	estado_actual = "idle"

func animacion_recibe_danio():
	play("recibe_danio")
	estado_actual = "recibe_danio"

func animacion_recibe_danio_2():
	play("recibe_danio_2")
	estado_actual = "recibe_danio_2"

func _on_golpear_pressed() -> void:
	boton_apretado = true
	if (estado_actual == "idle" and contador_clicks_golpear >= 0 and contador_clicks_golpear <= 1):
		animacion_recibe_danio()
		contador_clicks_golpear +=1
	elif (estado_actual == "idle" and contador_clicks_golpear >= 3 and contador_clicks_golpear <= 5):
		animacion_recibe_danio_2()
		contador_clicks_golpear += 1


func _on_animation_finished() -> void:
	if estado_actual == "recibe_danio" or "recibe_danio_2":
		boton_apretado = false
		animacion_idle()
