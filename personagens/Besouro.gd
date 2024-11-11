extends Node2D


var mov = Vector2.ZERO
var vida = 3 
export var direcao = 1 

func _process(_delta):
	
	mov_and_slide()
	
