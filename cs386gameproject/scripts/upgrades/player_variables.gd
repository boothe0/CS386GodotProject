extends Node
# Called when the node enters the scene tree for the first time.
var coins: int = 25
var rounds: int = 0

var health_scale: float = 1.0

var sword_damage_modifier: float = 1.0
var sword_scale: float = 1.0

var projectile_scale: float = 1.0

var base_speed = 150
var base_health = 5
var max_health = base_health
var MAX_STAMINA = 10
var MAX_MANA = 10
var health = max_health
var stamina = MAX_STAMINA
var mana: int = MAX_MANA

var consumable_set := []
