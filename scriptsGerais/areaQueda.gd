extends Area2D





func _on_areaQueda_body_entered(body):
	if(body.name == "Player"):
		Global.vidas -= 1
		
		if(Global.vidas) < 1:
			get_tree().change_scene("res://telas/gameOver.tscn")
		else:
			get_tree().reload_current_scene()
		

		



