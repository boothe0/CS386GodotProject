extends Node
# Called when the node enters the scene tree for the first time.
@onready var coins: int = 25
@onready var rounds: int = 0

@onready var health_scale: float = 1.0

@onready var sword_damage_modifier: float = 1.0
@onready var sword_scale: float = 1.0

@onready var projectile_scale: float = 1.0

@onready var base_speed = 150
@onready var base_health = 5
@onready var max_health = base_health
@onready var MAX_STAMINA = 10
@onready var MAX_MANA = 10
@onready var health = max_health
@onready var stamina = MAX_STAMINA
@onready var mana = MAX_MANA

@onready var consumable_set := []
