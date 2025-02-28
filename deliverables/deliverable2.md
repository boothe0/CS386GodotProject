# Deliverable 2: Requirements

## 1. Positioning
### Problem statement

The problem of no short form roguelite being available affects busy fans of the genre who don't have the time to play long runs, the impact of which is players being unable to have time to play games they enjoy. 

### Product Position Statement

For busy roguelite game fans who have limited time to enjoy roguelites, the Tiny Roguelite is a roguelite that presents a short form version of a rougelite game.
Unlike other games such as  The Binding of Isaac, Gungeon, or Slay the Spire which take up to an hour or more to complete a single run, our product takes much less time to play through for those who do not have the time to commit to a run of those longer-form games.

### Value proposition and customer segment

Value proposition: Tiny Roguelite is a roguelite game that allows busy fans of the genre to play their favorite genre without requiring a large time commitment, providing a short-form game with all the features of traditional games in the same genre.

Consumer segment: Busy roguelite fans with little time. 

## 2. Stakeholders

- Players
   - play the game to enjoy a shorter experience they can fit into their schedule.


- The Game Developers (us)
   - We add features and content according to the wants and needs of the player.

- Content creators that cover roguelikes
   - Content creators play and review our game to generate traction.

## 3. Functional requirements (features)

1. Takes less than 20 minutes to play through a run.
2. Upgrades that are purchasable and increase player strength.
3. Combat system (main gameplay loop)
   - Health
   - Melee Attacks
   - Ranged Attacks
   - Stamina Management
   - Mana Management
4. Defense Objective i.e. center core that player has to protect from enemies destroying.
5. Enemies that move to attack central objective and damage player if they get in the way.
6. Consumables that can be purchased in between rounds and used during combat to give player stat bonuses and special effects.
7. Intuitive UI that allows players to easy start and exit the game, hints to players what each of their buttons do, and allows players to purchase items in the shop.
8. Currency (Gold) that may be used to purchase shop items, dropped by enemies.
9. Item Drops (Gold/Consumables) that may be dropped by enemies when defeated.
10. A shop that allows players to buy consumables and upgrades using gold.
11. Brief lore describing the game's setting, main characters, and the objective.
12. Tutorial provided on the players first run which describes how to attack enemies, use consumables, and purchase items.

## 4. Non-functional requirements

1. Code Standards
   - code is properly commented to explain snippet functionality
   - all onready variables grouped together
   - scripts should not exceed 600 lines of code
2. Accessability
   - 9 out of 10 players surveyed report no difficulty navigating the UI
   - clear indications on how to play
3. Performance
    - 9 in 10 players surveyed say they experienced no performance issues
    - no loading time over 5 seconds that user cannot cancel
4. Compatability
   - playable Windows
   - playable Linux
   - playable MacOS
5. Scalability
   - modular design makes implementing different units in the same feature set take less than an hour
6. Maintainability
   - 1 new feature should be added every week per person indicating low technical debt

## 5. Minimum Viable Product

For the combat we will unit test ranged attacks to ensure they shoot projectiles. In addition, unit test melee attacks hit in a cone in front of the player. We will also unit test to ensure hit collision is valid. Finally unit test ensuring stamina and mana used without bugs allowing reduced or no cost. Central objective needs to be the focus here. Consumables will include, health potion, mana potion, speed potion, attack speed potion. We will unit test check each consumable provides the specified effect with the specified potentcy. For the enemies they should attack the player, the core objective and have successful pathfinding. Pathfinding towards the objective and towards theplayer is the most important. Enemies should contiue going to the core after disengaging from the player.

The shop will have random items, gold as a currency, player cannot spend more than what they own and the item needs to show up in the player's inventory. These features will also all be unit tested to unsure no bugs arise such asoverspending of gold, not enough randomization of items and to ensure gold is used.

## 6. Use cases

![UML Use Case Diagram](https://i.imgur.com/xotehwv.png)

1. Main menu
- **Use Case:** Use main menu
- **Actor:** Player
- **Trigger:** Player decides to open game.
- **Pre-conditions:** N/A
- **Post-condition:** Player has achieved desired result after engaging with menu.
- **Success Scenario:** 
1. User opens game.
2. System displays menu screen with three buttons: Start, Options, and Quit.
3. User clicks on desired button.
If the button is Start: 
4. System replaces title screen with gameplay screen.
5. System starts game.
If the button is Options:
4. System replaces title screen with options screen.
If the button is Quit:
4. System closes game.
- **Alternate Scenario #1:**
1. User does not click on any buttons.
2. System closes game after sufficiently long period of inactivity.

**Corresponding User Interface:**

![Main Menu Use Case](https://i.imgur.com/zjJUJfM.png)

2. Ranged Combat
- **Use Case:** Attack enemy with ranged attack
- **Actor:** Player
- **Trigger:** Player inputs button associated with ranged attack
- **Pre-conditions:** Player is in combat phase
- **Post-condition:** Player's attack damages enemy
- **Success Scenario:**
1. System spawns projectile next to the user's character
2. System moves projectile in the direction of where the user aimed
3. System displays projectile hitting the enemy
4. System causes enemy to lose health
- **Alternate Scenario #1:**
1. User does not aim towards enemy
2. System displays projectile missing the enemy
3. System displays projectile colliding with playable area walls
4. System displays projectile dissappearing
        
**Corresponding User Interface**

![Projectile Story](https://i.imgur.com/FvVaygD.png)

3. Melee Combat
- **Use Case:** Attack enemy with a melee attack
- **Actor:** Player
- **Trigger:** Player presses the corresponding button
- **Pre-conditions:** Player is in the gameplay stage
- **Post-condition:** Player's attack damages enemy
- **Success Scenario:**
1. User is within melee range of the enemy
2. User presses the button for a melee attack
3. System displays melee attack hitting enemy
4. System causes enemy to lose life according to the attack's power
- **Alternate Scenario #1:**
1. User is not in melee attack range
2. User presses the button for a melee attack
3. System displays melee attack missing the enemy

- **Corresponding User Interface:**

![Melee Story](https://i.imgur.com/DZ1zfc0.png)

4. Shop interface
- **Use Case:** Use shop
- **Actor:** Player
- **Trigger:** Player has reached the end of the round
- **Pre-conditions:** Player completed the previous round
- **Post-conditions:** System displays a menu with items for purchase
- **Success Scenario:**
1. User reaches the end of the round
2. System pauses game briefly
3. System displays message signalling the round's completion
4. System displays a pop-up menu showing items for sale
5. User can see the prices of items and a visual icon for each
- **Alternate Scenario #1:**
1. User does not reach the end of the round
2. System pauses game briefly
3. System displays message showing the player has lost
4. System displays restart option

- **Corresponding User Interface:**

![Shop Story](https://i.imgur.com/MnKEXl0.png)

## 7. User stories

- As a player I want to attack enemies at range to have additional combat depth.
     - Priority Level: 1
     - Estimated Time: 2 hours
- As a player I want to buy upgrades for my ranged attacks to slay more enemies and feel stronger.
     - Priority Level: 1
     - Estimated Time: 8 hours
- As a player I want to look at the gear I have obtained over the course of the game to get a sense of progression.
     - Priority Level: 1
     - Estimated Time: 4 hours
- As a player I want to know how many coins is needed to buy a certain item so I know whether to save or buy that round.
     - Priority Level: 2
     - Estimated Time: 1 hour
- As a player, I want to access the main menu so I can start the game, exit the game, or adjust game options.
     - Priority Level: 1
     - Estimated Time: 1 hour
- As a player, I want to see the health bar for my character as it updates with each attack so that I can determine how well I am doing in the game.
     - Priority Level: 2
     - Estimated Time: 3 hours
- As a player, I want to see the range of my melee attack so that I know if I am close enough for it to hit an enemy.
     - Priority Level: 3
     - Estimated Time: 4 hours
- As a player, I want to see how much damage my attacks are doing so that I can plan how to attack enemies
     - Priority Level: 3
     - Estimated Time: 2 hours

## 8. Issue Tracker

Link to issue tracker: [https://github.com/boothe0/CS386GodotProject/issues](https://github.com/boothe0/CS386GodotProject/issues)

![Issue Tracker](https://i.imgur.com/Yk8x1Az.png)


## Teamwork

The contribution of each team member may be different but we expect the amount of work to be roughly even.  When you submit the deliverable, the person submitting the deliverable should describe what each member worked on and a rough percentage estimation of their contribution as a submission comment. Here's an example:

    John Doe (40%) – Conducted 2 interviews, wrote section 2.3, and reviewed the whole document.
    Mary Shawn (40%) – Conducted 1 interview, wrote sections 1 and 2.1, reviewed section 2.3, and worked on the source code.
    Lucy Johnson (20%) – Wrote section 2.2 and performed code review.

We will also be reviewing your github repository, which should also reflect the work happening in your team.  Every team member should be committing and making meaningful contributions in your repository.

Individual grades may be reduced based on a combination of what we see in the deliverable summary and github contributions.  If there's no evidence that a team member contributed to the deliverable, they should absolutely expect to receive a zero!
