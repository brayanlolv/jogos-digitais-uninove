extends Control


func _ready():
	Global.cena_anterior =  get_tree().current_scene.filename

func _on_iniciar_pressed():
	get_tree().change_scene("res://fase1[.tscn")



func _on_sair_pressed():
	get_tree().quit()



func _on_configuracoes_pressed():
	get_tree().change_scene("res://telas/configuracoes.tscn")
