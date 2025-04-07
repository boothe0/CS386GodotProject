# Deliverable 5: Design

## Description
Our game is a 2D, top-down roguelike inspired by ancient Greek themes, where the player takes on the role of a protector tasked with defending a central objective. The core gameplay is round-based combat, featuring both ranged and melee enemies who seek to destroy the center or eliminate the player. The player must manage three key resources—health, mana, and stamina—while utilizing dodge mechanics, melee attacks, and projectiles to survive. After each round, players enter a shop phase where they can spend coins earned from fallen enemies to purchase upgrades, abilities, and potions. The player also manages a limited inventory with three slots to equip and use these items during combat.

The system behind the game is structured into three main architectural layers: the visual, logic, and data layers. The visual layer handles everything the player sees, including the UI and scene transitions. The logic layer governs how the game reacts to user input and manages core systems like combat mechanics, upgrades, and scene flow. This layer is further split into general logic and visual logic, which helps separate game-wide behavior (e.g., pausing, death) from object-specific visuals (e.g., sprite appearance, animations). Finally, the data layer handles persistent game data like player stats and upgrade states, which the logic layer pulls from as needed. This layered architecture supports clean separation of concerns, maintainability, and scalability as the game evolves.

## Architecture
![Architecture UML Diagram](https://i.imgur.com/QcrGifk.png)

Our Architecture is made up of three main layers: The visual layer, the logic layer, and the data layer. The visual layer is what the player directly sees when player our game, that being what is shown explicitly on the screen (the user interface, current scene). The visual layer relies on the logic layer, where depending on how the player interacts with the game, the logic layer will process the interaction, and display the outcome on the visual layer. So in the logic layer, is all the script required to make the game run. The visual layer is seperated into two distinct sections: Visual logic, and general logic. General logic includes script for system wide properties (death, start, pause, etc) while the visual logic includes aspects specific to how specific objects slooks (assets, visibility). Finally, the last layer is the data layer which stores all the infomation on saved game data. The logic layer pulls from this layer to fill in variables like current health, strength, and abilities. 

## Class Diagrams
![UML Class Diagram](https://imgur.com/LtJcVIV.png)

## Sequence Diagrams

Use Case Description: 
- Use Case: Defeat enemy in ranged combat
- Actor: Player
- Trigger: Player inputs button associated with ranged attack
- Pre-conditions: Player is in combat phase
- Post-conditions: Player kills enemy and gains coins from attack
- Success Scenario:
   1. System spawns projectile next to the user's character
   2. System moves projectile in the direction of where the user aimed
   3. System displays projectile hitting the enemy
   4. System causes enemy to lose health
   5. System displays enemy disappearing
   6. System displays coin spawning next to user's character
   7. User accumulates coin
- Alternate Scenario #1:
   1. User does not aim towards enemy
   2. System displays projectile missing the enemy
   3. System displays projectile colliding with playable area walls
   4. System displays projectile dissappearing

Sequence Diagram:

![Sequence Diagram](https://i.imgur.com/avGmTB6.png)

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

Each script in Godot as well as each scene is considered a class and therefore the SOLID priciples can be applied to these 
areas. 

### S- Single Responsibility
This priciple is observed throughout our project as each script is connected to a relevant node that is only used for that specific node. 

For example, we have a coin script that is only used for the coin behavior and nothing else. 

![Coin Script](https://i.imgur.com/3x2CLik.png)

The above code shows that the coin script is separated from the rest of the scripts as it just has variables and textures related to the coins.

Another example is the health bar script that is only used to update the visual for the player health on the UI

Finally, our scripts/heal_potion.gd is used for the healthing animation to show that the main character is healing for feedback to the player.

### O- Open for extention and closed for modification

This is also used in the coin script as it will never be modified but coin types are able to be added without changing the base script.

Another script that uses this principle is the health bar script as this will never be modified as the values will stay constant. It can be 
extended to support other bars that have a similar principle.

Scripts/heal_potion.gd is also open for extention to add more animations or other potions but the tween amount will always
stay the same between extentions.

### L- Liskov Substitution

In the coin script that is connected to several coin textures which are considered "classes" in Godot the script works the same for each one
and can be interchanged for different types of these textures. This way, different values of coins such as 5 units for a coin with a gold texture
can be used for randomizing loot drops from enemies. 

In the health_bar script it is connected to the health potion which has its own script. This is able to be interchanged due to the 
interconnected function that this provides. The health potion sends a signal that the health_bar script uses to trigger the change in the health bar 
amount that is displayed to the player.

The scripts/health_potion script it is connected to the health bar script and the emitter script we have for item functions triggers. This can be 
substituted in other scripts to have similar functionality and trigger other functions that can be attached to the health potion or other consumables.

### I- Interface Segregation

In the coin script there is a separation of several textures from the functions. For example the bronze, silver and gold textures are preloaded 
not within the ready function to help with performance. If these textures were instead put inside the ready or another function that was called more often
it would hinder the performance.

In the health bar script there is an emitter of health_update connected to a separate function within the script. This splits up the code to be 
smaller and easier to read. Having an outside emmitter calling the update() function removes the need for more lines of code within the ready function
which makes the health_bar script run faster.

The scripts/health_potion script is split into several functions use heal potion and set potion direction. While these could have been combined,
one function primarily uses vectors and coordinates while the other use heal potion uses tweening functions. Separating these makes it easy to 
understand the difference of what is going on in this script for the potion animation

![Function Tween](https://i.imgur.com/e3SU7mP.png)

![Function Vectors](https://i.imgur.com/D7UBDyW.png)

### D- Dependency Inversion

In the on body entered function within the coin script uses a node of on body entered that references when the player enters the coins 
collision shape. This removes the need to have another function coupled within a manually made one and just have the node directly attached to the script.

![Coin on body entered](https://i.imgur.com/elH5vq6.png)

In the health bar script there are premade method calls such as instantiate and display that are references to displaying the health bar after taking
damage. These functions remove the need for more manual functions to be made which would make the code less readable. 

In the scripts/heal potion script set potion direction and use heal potions were separated from being within eachother so one does not need
to depend on the other and have different functions that are easy to tell apart.

## Teamwork

