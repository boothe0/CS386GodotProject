extends CharacterBody2D

@onready var animationShop = $AnimatedSprite2D

func _ready():
	animationShop.play("idleAnimation")
