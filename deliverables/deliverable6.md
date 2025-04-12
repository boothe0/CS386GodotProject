# Deliverable 6: Implementation 2

## Introduction

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
- Issue: #186 [Link to issue 220](https://github.com/boothe0/CS386GodotProject/issues/220)
- Pull Requests: #213 [Link to PR number 213](https://github.com/boothe0/CS386GodotProject/pull/213)
- Implemented by: Chandler Silk
- Approved by: Elizabeth Booth
- Print Screen: The screenshot shows the player playing in the level, showing the new level art I designed, as well as the walls acting as collision objects with entities.

![Image of implementation](https://imgur.com/TEQ9f5M.png)

## Tests

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
