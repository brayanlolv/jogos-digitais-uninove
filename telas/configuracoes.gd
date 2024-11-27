extends Control

func _process(delta):
	if Input.is_action_pressed("menu"):
		get_tree().change_scene("res://telas/configuracoes.tscn")

func _on_ok_pressed():
	get_tree().change_scene(Global.cena_anterior)




func _on_VolumeMusica_drag_ended(value_changed):
	Global.volume_musica = $VBoxContainer/VolumeMusica.value



func _on_VolumeEfeitos_drag_ended(value_changed):
	Global.volume_efeitos = $VBoxContainer/VolumeEfeitos.value



func _on_sair_pressed():
	get_tree().change_scene("res://telas/inicial.tscn")
