extends CharacterBody2D

@onready var animationShop = $AnimatedSprite2D
@onready var interactable: Area2D = $Interactable

func _ready():
	animationShop.play("idleAnimation")

	
