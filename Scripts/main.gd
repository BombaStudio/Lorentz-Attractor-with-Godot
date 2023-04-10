extends Node3D

var variables:Vector3
var time:float
var index:int

func _ready():
	index = 0
	
func lorenz(t,s,r,b,pos):
	var x = pos.x
	var y = pos.y
	var z = pos.z
	
	var dx = s * (y - x)
	var dy = x * (r - z) - y
	var dz = x * y - b * z
	
	var dpos = Vector3(dx,dy,dz)
	pos += dpos * t
	
	var data = {
		"pos":pos,
		"dpos": dpos
	}
	print(data)
	return data

func _physics_process(delta):
	#$rotateCam.rotate_y(delta/2)
	$environmet/CharacterBody3D.translate(lorenz(time,variables.x,variables.y,variables.z,$environmet/CharacterBody3D.position)["dpos"])
	#$environmet/Path3D.curve.set_point_position(index,lorenz(time,variables.x,variables.y,variables.z,$environmet/CharacterBody3D.position)["dpos"])
	time += delta
	#index += 1
	
func _process(delta):
	variables.x = $CanvasGroup/sigma.value
	variables.y = $CanvasGroup/rho.value
	variables.z = $CanvasGroup/beta.value
func _draw():
	pass
