# Deliverable 5: Design

## Description
Our game is a 2D, top-down roguelike inspired by ancient Greek themes, where the player takes on the role of a protector tasked with defending a central objective. The core gameplay is round-based combat, featuring both ranged and melee enemies who seek to destroy the center or eliminate the player. The player must manage three key resources—health, mana, and stamina—while utilizing dodge mechanics, melee attacks, and projectiles to survive. After each round, players enter a shop phase where they can spend coins earned from fallen enemies to purchase upgrades, abilities, and potions. The player also manages a limited inventory with three slots to equip and use these items during combat.

The system behind the game is structured into three main architectural layers: the visual, logic, and data layers. The visual layer handles everything the player sees, including the UI and scene transitions. The logic layer governs how the game reacts to user input and manages core systems like combat mechanics, upgrades, and scene flow. This layer is further split into general logic and visual logic, which helps separate game-wide behavior (e.g., pausing, death) from object-specific visuals (e.g., sprite appearance, animations). Finally, the data layer handles persistent game data like player stats and upgrade states, which the logic layer pulls from as needed. This layered architecture supports clean separation of concerns, maintainability, and scalability as the game evolves.

## Architecture
![Architecture UML Diagram](https://i.imgur.com/QcrGifk.png)

Our Architecture is made up of three main layers: The visual layer, the logic layer, and the data layer. The visual layer is what the player directly sees when player our game, that being what is shown explicitly on the screen (the user interface, current scene). The visual layer relies on the logic layer, where depending on how the player interacts with the game, the logic layer will process the interaction, and display the outcome on the visual layer. So in the logic layer, is all the script required to make the game run. The visual layer is seperated into two distinct sections: Visual logic, and general logic. General logic includes script for system wide properties (death, start, pause, etc) while the visual logic includes aspects specific to how specific objects slooks (assets, visibility). Finally, the last layer is the data layer which stores all the infomation on saved game data. The logic layer pulls from this layer to fill in variables like current health, strength, and abilities. 

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

