extends Control



func _ready():
	Global.vidas = 3


func _on_novamente_pressed():
	
	get_tree().change_scene("res://fase1[.tscn")


func _on_desisitr_pressed():
	get_tree().quit()

func _on_Menu_pressed():
	get_tree().change_scene("res://telas/inicial.tscn")

