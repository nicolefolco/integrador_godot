extends AnimatedSprite2D

var estado_actual = "idle"
var contador_clicks_golpear = 0 

func _ready():
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
	if (estado_actual == "idle" and contador_clicks_golpear >= 3 and contador_clicks_golpear <= 5):
		play("recibe_danio_2")
		estado_actual = "recibe_danio_2"
		contador_clicks_golpear += 1
	

func _on_golpear_pressed():
	if (estado_actual == "idle" and contador_clicks_golpear >= 0 and contador_clicks_golpear <= 1):
		animacion_recibe_danio()
		contador_clicks_golpear +=1
	else:
		animacion_recibe_danio_2()


func _on_animation_finished():
	if estado_actual == "recibe_danio" or "recibe_danio_2":
		animacion_idle()
