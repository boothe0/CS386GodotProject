# Deliverable 4

## Introduction
Tiny Roguelite is a roguelite game that allows busy fans of the genre to play their favorite genre without requiring a large time commitment, providing a short-form game with all the features of traditional games in the same genre. This game allows players to play through a run in under twenty minutes while still containing an engaging story and multiple rounds of combat. The game's combat system enables players to attack enemies with ranged and melee attacks, as well as keeping track of both the player's and the enemies' health and stamina. The enemies will move to attack a defense objective in the center of the game arena which the player must defend, adding difficulty to the game. Moreover, at the end of each round, players can use the coins they obtain from defeating enemies to purchase upgrades and consumables in the game's shop so that they can use these items in future rounds to attack enemies more effectively.

Project Link: [https://github.com/boothe0/CS386GodotProject](https://github.com/boothe0/CS386GodotProject)

## Requirements (The most points)
Base template for requirements

Requirement: User story
Issue: Link to github issue
Pull Request: Link
Implemented by:
Approved by:
Print Screen: Displays implemented feature.

- Requirement: As a player I want to know how many coins is needed to buy a certain
item so I know whether to save or buy that round.
- Issue: #43 [Link to issue 43](https://github.com/boothe0/CS386GodotProject/issues/43)
- Pull Request: #122 [Link to PR number 122](https://github.com/boothe0/CS386GodotProject/pull/122)
- Implemented by: Elizabeth Booth
- Approved by: Asher Romanenghi
- Print Screen: The coins label in the top left carrying over to the shop and items on the table. It has 
been refined over time.

![Image of implementation](https://i.imgur.com/NDVecax.png) 

- Requirement: As a player, I want to be able to play through a short tutorial of the game so I know how the game controls work.
- Issue: #103 [Link to issue 103](https://github.com/boothe0/CS386GodotProject/issues/103)
- Pull Request: #128 [Link to PR number 128](https://github.com/boothe0/CS386GodotProject/pull/128)
- Implemented by: Camelia Mosor
- Approved by: Elizabeth Booth
- Print Screen: This screen displays the tutorial as it loops through various instructions. The player can practice how to use the controls by pressing on each key, which will cause the player sprite to respond accordingly.

![Image of implementation](https://i.imgur.com/i41PKd4.png) 

- Requirement: As a player I want to buy upgrades for my ranged attacks to slay more enemies and feel stronger.
- Issue: #41 [Link to issue 41](https://github.com/boothe0/CS386GodotProject/issues/41)
- Pull Request: #153 [Link to PR 153](https://github.com/boothe0/CS386GodotProject/pull/153)
- Implemented by: Asher Romanenghi
- Approved by: Elizabeth Booth
- Print Sceen: This displays a purchasable upgrade available in the shop.

![Image of implementation](https://i.imgur.com/FWRLyCT.png)

- Requirement: As a player, I want to see how much damage my attacks are doing so that I can plan how to attack enemies.
- Issue: #45 [Link to issue 45](https://github.com/boothe0/CS386GodotProject/issues/45)
- Pull Request: #75 [Link to PR 75](https://github.com/boothe0/CS386GodotProject/pull/75)
- Implemented by: Asher Romanenghi
- Approved by: Elizabeth Booth
- Print Screen: A red "1" appears above the player after being attacked by an enemy and taking 1 damage.

![Image of Implementation](https://i.imgur.com/JmQTJXs.png)

- Requirement: As a player, I want to see how much damage my attacks are doing so that I can plan how to attack enemies.
- Issue: #45 [Link to issue 45](https://github.com/boothe0/CS386GodotProject/issues/45)
- Pull Request: #75 [Link to PR 75](https://github.com/boothe0/CS386GodotProject/pull/75)
- Pull Request: #17 [Link to PR 17](https://github.com/boothe0/CS386GodotProject/pull/17)
- Implemented by: Asher Romanenghi
- Approved by: Elizabeth Booth
- Print Screen: A red "2" and diminished health bar appears above an enemy after being attacked by the player for 2 damage.

![Image of Implementation](https://i.imgur.com/HyxLC09.png)

- Requirement: As an artist, I want the game to have a set of artistically pleasing items and consumables that feel relevant to the story, so that I feel immersed in the world of the game.
- Issue: #175 [Link to issue 175](https://github.com/boothe0/CS386GodotProject/issues/175)
- Pull Request: #184 [Link to PR number 184](https://github.com/boothe0/CS386GodotProject/pull/184)
- Implemented by: Maya Harvey
- Approved by: Elizabeth Booth
- Print Screen: Upgrades and Consumables have not yet been implemented in the game, but can be found in the [folder for Items and Upgrades](https://github.com/boothe0/CS386GodotProject/tree/main/cs386gameproject/assets/items/upgrades)

## Tests
- Test framework 
    - GUT (Godot Unit Tests)
- Link to Github folder for automated unit tests
    - https://github.com/boothe0/CS386GodotProject/tree/main/cs386gameproject/tests/unit_tests
- An example of a test case. Include github link to class being tested and the test.
    - Description: Tests to make sure player methods work properly. Both in taking damage and healing
    - Test: https://github.com/boothe0/CS386GodotProject/blob/main/cs386gameproject/tests/unit_tests/test_player.gd
    - Class Tested: https://github.com/boothe0/CS386GodotProject/blob/main/cs386gameproject/tests/test_scripts/player.gd
- Screenshot showing execution of all automated tests

![Test Result](https://i.imgur.com/MWdkiGb.png)

The result shows that we have a bug with player health going above max if taking negative damage.


## Technology
- Github: Github is a Web platform for Git. It is a version control system that that handles storing, sharing, and managing code between a team. Github is used widely among programmers and software engineers, both in the educational and professional setting.

- GUT: GUT, or Godot Unit Tests, is a test framework that is specifically for GDScript code.  
  
- Godot: Godot is an open-source game engine for 2D and 3D game development. We chose to use Godot for it's friendly user interface, open-source factor, and handling of merge conflicts.
  
- Procreate: Procreate is a popular art software that can handle pixel art, and animation. It is user friendly, and intuitive. Members have used it as their main software for digital art, so they are already familar with it's interface, tools, and capabilities.

- Krita: Krita is a free, open-source painting software made for digital art and 2d animation. It's affordability, and open source factor made it a good option for our artists to use.

- Aseprite: Aseprite is a software that's main use is for pixel art and animation. Our game uses pixel art, so it is a great option for creating sprite for our game. 

## Deployment
Our game is being developed on Godot and is currently being stored locally. Due to this we will not be deploying the system nor have a live version.

## Licensing

## Readme File

## UX Design
We approched UX in the following ways.

1. The controls needed to be quick and simple to learn for any player to be able to jump in and quickly finish the game as intended. Since the target audience are
busy people with little time they are less likely to be willing to learn many keybinds so we kept it simple. Many of the controls are hinted at within the user interface.
- For example the dodge button is space bar signaled in the stamina bar in the upper right. 

![Space-Bar Hint](https://i.imgur.com/cFzsltR.png)

2. Continuing with the User Interface it needs to be sufficient enough to let the player know what to do but not overwhelming to the point of breaking immersion. For solving this issue
we decided to have a slot system on the right side that acts as the player inventory. Instead of the user going through multiple menus they can take a quick glance and know what they have.
- Here is the inventory system with the colors of purple and black as the backdrop.

![Inventory System](https://i.imgur.com/fw0Ssq0.png)

3. The shop scene has labels that pop-up as the player gets close to the item posts that show all nessecary information such as how much the item costs, the effect and type of item it is. There is again no extra menus
that the user can get caught up in. This is a constant theme throughout the UX design - keeping the player engaged in the world. This concept is taken from games such as Metro Exodus where everything from the map
to the weapons are within the world and not a dedicated menu. 
- Here is an example of the label pop-up functionality:

![Label Pop-Up](https://i.imgur.com/eu0HehF.png)

4. There also needs to be a constant theme throughout the game to distinguish it from being an "asset flip". The color scheme that was choosen is purple, white and black with hints of gold throughout. We settled 
on a story surrounding greek mythology which is common enough that the player would be able to understand references to monsters such as Cerberus or the underworld. Having a theme provides a clear direction and goal
for the player as the main character battles through the underworld to get to his wife. Having an established story and game design centered around this, furthers the interest of the player in the game. 
- Screens such as the death, and title screen have references to greek culture.

![Title Screen](https://i.imgur.com/XPywUzT.png)

![Death Screen](https://i.imgur.com/WZThyJs.png)

## Lessons Learned
What was learned during first release.

## Demo
Link to video demo showing the game so far.
