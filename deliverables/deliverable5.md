# Deliverable 5: Design

## Description

## Architecture

## Class Diagrams

## Sequence Diagrams

Use Case Description: 

- Use Case: Purchase shop item
- Actor: Player
- Trigger: Player selects item to purchase
- Pre-conditions: Player completed the previous round and has entered shop scene
- Post-conditions: System has added shop item to player's inventory
- Success Scenario:
   1. User selects desired shop item
   2. System displays details and price for the item
   3. User clicks to purchase item
   4. System subtracts appropriate amount of coins from player's coin total
   5. System adds shop item to player's inventory
   6. System closes display box for the item
- Alternate Scenario #1:
   1. User does not have enough coins to buy the item
   2. System displays message to alert user that they cannot purchase the item
   3. System closes display box for the item

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

