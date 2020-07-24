extends StaticBody2D
var Health = 10

func Health():
	if Health == 0:
		emit_signal ("killed")
	
	
signal killed(killed)



func _on_area2D_entered(area):
	Health = 0
	emit_signal ("killed")
