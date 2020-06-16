extends Area2D

#func _on_paodeQueijo_body_entered(body):
func _on_ourico_body_entered(body):
	
	if body.name == "Player":
		$eat.play()
		#todo: fazer função de somar vida ou contar pontos
	

func _on_eat_finished():
	queue_free()
