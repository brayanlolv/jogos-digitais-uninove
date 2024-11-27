extends Control

func _ready():
	$vidas_numero.text = str(Global.vidas) 


func _on_Menu_pressed():
	get_tree().change_scene("res://telas/configuracoes.tscn")
	
