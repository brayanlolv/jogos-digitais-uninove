extends Node2D


var Boss = preload("res://personagens/Leandro.tscn")


func _ready():
	Global.cena_anterior = get_tree().current_scene.filename
	Global.vida_jogador = 100
	
	$MusicaFase.volume_db = (Global.volume_musica - 40)
	pass # Replace with function body.


func _process(_delta):
	if Input.is_action_pressed("menu"):
		get_tree().change_scene("res://telas/configuracoes.tscn")


func _on_Area2D_body_entered(body):
	if body.name == 'Player':
		var boss = Boss.instance()	
		boss.global_position = $boss/bossposicao.global_position
		get_tree().root.add_child(boss)
	pass # Replace with function body.
