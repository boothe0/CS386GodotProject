# Deliverable 6: Implementation 2

## Introduction

Tiny Roguelite is a roguelite game that allows busy fans of the genre to play without having to make a large time commitment, providing a short-form version of the genre that still contains all the features found in a traditional rougelite game. This game allows players to complete a run in under twenty minutes while still being immersed in an engaging story and multiple rounds of combat. The game's combat system enables players to attack enemies with melee and ranged attacks, as well as keeping track of both the player's and the enemies' health and stamina. The player's main objective during a battle is to defend an object that is located at the center of the game arena from an onslaught of enemies who are moving in to attack from every direction. This constant onslaught of enemies combined with the stamina system requires the player to strategically attack based on their current strength and capabilites, adding difficulty to the game. Moreover, at the end of each round, the player can use the coins they collected from defeating enemies to purchase upgrades and consumables in the game's shop that increase their strength so that in future rounds they can attack enemies more efficiently.

Project Link: https://github.com/boothe0/CS386GodotProject

## Requirements

- Requirement: As a player, I want to be able to play through a short tutorial of the game so I know how the game controls work.
- Issue: #103 [Link to issue 103](https://github.com/boothe0/CS386GodotProject/issues/103)
- Pull Request: #128 [Link to PR number 128](https://github.com/boothe0/CS386GodotProject/pull/128)
- Implemented by: Camelia Mosor
- Approved by: Elizabeth Booth
- Print Screen: This screen displays the tutorial as it loops through various instructions. The player can practice how to use the controls by pressing on each key, which will cause the player sprite to respond accordingly.

![Image of implementation](https://i.imgur.com/i41PKd4.png) 

- Requirement: As a player, I want to be able to read a brief introduction to the game so I understand the backstory, setting, and motivation of my character.
- Issue: #104 [Link to issue 104](https://github.com/boothe0/CS386GodotProject/issues/104)
- Pull Request: #123 [Link to PR number 123](https://github.com/boothe0/CS386GodotProject/pull/123)
- Implemented by: Camelia Mosor
- Approved by: Elizabeth Booth
- Print Screen: This screen displays the introduction to the game.

![Image of implementation](https://i.imgur.com/giGyijC.png) 

- Requirement: As an artist, I want want the game sprites and aesthetic designs to reflect the unique setting of the game so that I can play in a compelling and immersive environment.
- Issue: #218 [Link to issue 218](https://github.com/boothe0/CS386GodotProject/issues/218)
- Pull Requests: #100 [Link to PR number 100](https://github.com/boothe0/CS386GodotProject/pull/100), #162 [Link to PR number 162](https://github.com/boothe0/CS386GodotProject/pull/162), #193 [Link to PR number 193](https://github.com/boothe0/CS386GodotProject/pull/193)
- Implemented by: Camelia Mosor
- Approved by: Asher Romanenghi (#100), Elizabeth Booth (#162, #193)
- Print Screen: The first screen displays the sprites I designed for the player character and non-ranged enemies, and the second displays the background art I created for the title scene based on the art on Greek vases.

![Image of implementation](https://i.imgur.com/8OySbJk.png) 
![Image of implementation](https://i.imgur.com/BvslVSl.png) 

- Requirement: As a player, I want smooth combat mechanics, so that the game feels more engaging.
- Issue: #186 [Link to issue 186](https://github.com/boothe0/CS386GodotProject/issues/186)
- Pull Requests: #203 [Link to PR number 203](https://github.com/boothe0/CS386GodotProject/issues?q=is%3Apr+author%3AethanSchoolAccount)
- Implemented by: Ethan Meyer
- Approved by: Elizabeth Booth
- Print Screen: The screenshot displays the player being attacked by our two different enemies, ranged and melee.

![Image of implementation](https://i.imgur.com/swuTrnY.png)

- Requirement: As a player, I want to have some form of assistance, during combat so that when the difficulty scales, I have something to help out
- Issue: #186 [Link to issue 219](https://github.com/boothe0/CS386GodotProject/issues/219)
- Pull Requests: #203 [Link to PR number 217](https://github.com/boothe0/CS386GodotProject/pull/217)
- Implemented by: Ethan Meyer
- Approved by: Elizabeth Booth
- Print Screen: The screenshot shows when the player's shield breaks, emitting particles, acting as a message to the player letting them know protection is now gone.

![Image of implementation](https://i.imgur.com/QGby2Wx.png)

- Requirement: As a player, I want to have some form of assistance, during combat so that when the difficulty scales, I have something to help out
- Issue: #220 [Link to issue 220](https://github.com/boothe0/CS386GodotProject/issues/220)
- Pull Requests: #213 [Link to PR number 213](https://github.com/boothe0/CS386GodotProject/pull/213)
- Implemented by: Chandler Silk
- Approved by: Elizabeth Booth
- Print Screen: The screenshot shows the player playing in the level, showing the new level art I designed, as well as the walls acting as collision objects with entities.

![Image of implementation](https://imgur.com/TEQ9f5M.png)

- Requirement: As a player, I want the difficulty to scale as I get stronger
- Issue: #159 [[Link to issue 159](https://github.com/boothe0/CS386GodotProject/issues/159)
- Pull Requests: #213 [Link to PR number 213](https://github.com/boothe0/CS386GodotProject/pull/213)
- Implemented by: Asher Romanenghi
- Approved by: Ethan Meyer
- Print Screen: The screenshot shows the player taking 4 damage in one hit after a few rounds have passed and the enemies now deal more damage.

![Image of implementation](https://i.imgur.com/6dyIQC0.png)

- Requirement: As an artist, I want the game to have a set of artistically pleasing items and consumables that feel relevant to the story, so that I feel immersed in the world of the game.
- Issue: #175 [Link to issue 175](https://github.com/boothe0/CS386GodotProject/issues/175)
- Pull Requests: #221 [Link to PR number 221](https://github.com/boothe0/CS386GodotProject/pull/221)
- Implemented by: Maya Harvey
- Approved by: Camelia Mosor
- Print Screen: These new upgrades and consumables have not yet been implemented in the game, but can be found in the folder for [Items and Upgrades](https://github.com/boothe0/CS386GodotProject/tree/main/cs386gameproject/assets/items/upgrades)

## Tests

- **Testing Framework:** GUT (Godot Unit Test)
- **Unit Tests Folder:** https://github.com/boothe0/CS386GodotProject/tree/main/cs386gameproject/tests/unit_tests
- **Test Written For:** Melee Enemy https://github.com/boothe0/CS386GodotProject/blob/main/cs386gameproject/scripts/enemy.gd
- **Test Link:** https://github.com/boothe0/CS386GodotProject/tree/main/cs386gameproject/tests/unit_tests/test_enemy.gd
- Print Screen: Test results show that the enemy has more than their max health whenever taking negative damage. This should be addressed by adding some checks to ensure the enemy is always at or below max hp

![Image of Test Results](https://i.imgur.com/vK0ASse.png)

## Demo

Link showing the demo of the second release of the game. https://www.youtube.com/watch?v=VBub0hJSCcI

## Code Quality

Our team adheres to the following policies in order to maintain high-quality, readable code: 
- We have explanatory comments added to every section of code for which it is necessary to clarify the code's purpose. These comments are brief, straightforward, and only added where needed, so our code is not overwhelmed with unnecessary comments.
- We apply consistent coding conventions, such as having regular spacing and using CamelCase for the names of all Godot nodes while using lowercase with underscores for functions and variable names, so that our code follows one uniform style.
- We keep our scripts as short as is feasible - for instance, our longest script is 306 lines long, and most other scripts don't go beyond 100 lines - in order to prevent scripts from becoming too complicated and lengthy. Moreover, each separate aspect of the game has a unique script assigned to it, so it is easy to find the code responsible for the functionality of different parts of the game.
- We separate blocks of code that have different purposes within a function or script using blank lines for increased readability.
- All our variable, constant, and function names are straightforward and descriptive - some examples are the variable dist_to_player, the function use_heal_potion, and the constant MAX_STAMINA - so their purpose in our program is very clear, and it is easy to understand exactly what task a piece of code is performing.

## Lessons Learned

For this release, we as a team learned and improved on operating within our roles on the team. For the first release, we were still trying to figure out who exactly would work on what parts of the game, not to mention onboarding two new team members right before the release. This led to every decision needing to be discussed so that development didn't overlap, and the distribution of work being uneven at times. As we worked on this release of the game, everyone knew what they were working on, and who would be doing what, so it was much easier to focus on our individual projects. Whether it was producing art or developing consumables and upgrades, everyone contributed in significant ways, and the overall vision of the project became much clearer as a result. In addition, we learned a big lesson on rolling back versions and the importance of version control. There was a mistake while merging a pull request which rendered the game unplayable. Thanks to our previous work in ensuring version control, rolling back the merge and redoing it was a straightforward process.

## Teamwork

Chandler: 14% Completed new tile set with collisions and worked on lessons learned in deliverable 6.

Asher: 14% Completed 2 upgrades and added difficulty scaling. Worked on testing for deliverable 6.

Ethan: 14% Completed armor system and worked on requirement section for deliverable 6.

Maya: 14% Completed artwork for 3 new consumables and uploaded three new upgrades and consumables. Did the intro in deliverable 6.

Camelia: 14% Completed designs for final boss and added character's wife sprites to the game. Worked on code quality section in deliverable 6.

Elizabeth: 14% Made smaller UI fixes, added music/audio cues and finished inventory buy system. Worked on demo in deliverable 6.

Gordon: 14% Made artwork for boss designs and ghouls. 


