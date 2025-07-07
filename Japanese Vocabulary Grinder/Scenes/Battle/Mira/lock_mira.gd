extends Sprite2D

var targets = []

func _ready():
	Variables.LockMira = self
	self.hide()
	self.global_position = Variables.Player.global_position

func _process(delta):
	self.rotate(delta)
	
	if len(targets) > 0:
		Variables.Player.near = true
		self.global_position = self.global_position.slerp(targets[0].global_position, delta * 4)
		self.show()
	else:
		Variables.Player.near = false
		self.hide()
		self.global_position = Variables.Player.global_position

func Remove(target):
	if targets.has(target):
		targets.erase(target)
