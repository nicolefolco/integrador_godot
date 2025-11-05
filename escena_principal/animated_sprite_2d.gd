extends AnimatedSprite2D

var estado_actual = "idle"
var contador_clicks_golpear = 0 

func _ready():
	play("idle")

func animacion_idle():
	play("idle")
	estado_actual = "idle"

func animacion_recibe_danio():
	play("recibe_danio")
	estado_actual = "recibe_danio"

func animacion_recibe_danio_2():
		play("recibe_danio_2")
		estado_actual = "recibe_danio_2"

func animacion_se_enoja_mucho():
	play("se_enoja_mucho")
	estado_actual = "se_enoja_mucho"

func _on_golpear_pressed():
	if (estado_actual == "idle" and contador_clicks_golpear >= 0 and contador_clicks_golpear <= 1):
		animacion_recibe_danio()
		contador_clicks_golpear +=1
	elif (estado_actual == "idle" and contador_clicks_golpear >= 2 and contador_clicks_golpear <= 5 ):
		animacion_recibe_danio_2()
		contador_clicks_golpear += 1
	else:
		animacion_se_enoja_mucho()


func _on_animation_finished():
	if estado_actual == "recibe_danio" or "recibe_danio_2":
		animacion_idle()

func _on_reiniciar_pressed() -> void:
	stop()
	animacion_idle()
	contador_clicks_golpear = 0
