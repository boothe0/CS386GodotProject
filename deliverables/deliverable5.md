# Deliverable 5: Design

## Description

## Architecture

## Class Diagrams

## Sequence Diagrams

Use Case Description: 
- Use Case: Engage in ranged combat
- Actor: Player
- Trigger: Player inputs button associated with ranged attack
- Pre-conditions: Player is in combat phase
- Post-conditions: Player's attack damages enemy
- Success Scenario:
   1. System spawns projectile next to the user's character
   2. System moves projectile in the direction of where the user aimed
   3. System displays projectile hitting the enemy
   4. System causes enemy to lose health
   5. System updates player's stamina and mana bars
- Alternate Scenario #1:
   1. User does not aim towards enemy
   2. System displays projectile missing the enemy
   3. System displays projectile colliding with playable area walls
   4. System displays projectile dissappearing
- Alternate Scenario #2:
   1. User fails to dodge attack from enemy
   2. System displays attack impacting user's character
   3. System causes player to lose health
   4. System updates player's stamina and mana bars

  Sequence Diagram:

  ![Sequence Diagram](https://i.imgur.com/AHr18EU.png)

## Design Patterns
1. The Composite Pattern
   - https://github.com/boothe0/CS386GodotProject/blob/main/cs386gameproject/scenes/main_scene.tscn
   - Implented directly into the Godot engine with scenes being structured as a tree
   - Each scene has a parent node which is composed of many other child nodes, each with thier own functionality
   - Follows the open/closed principle by extending scenes without modifying existing functionality

   ![Composite Design](https://i.imgur.com/iQ7nSOh.png)

2. The Singleton Pattern
   - https://github.com/boothe0/CS386GodotProject/blob/main/cs386gameproject/scripts/upgrades/player_variables.gd
   - Implemented directly into the Godot engine using the Autoload feature
   - Allows for global access of static player variables across scenes

   ![Autoloading Singleton](https://i.imgur.com/5arA4lm.png)

## Design Principles

## Teamwork

