# Deliverable 4

## Introduction
Paragraph
- Value proposition
- Main feature descriptions
- After paragraph add link to the project.

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

The result shows that we have a bug with player health going above max if taking negative damage



## Technology
- List technology used example; Godot, Art software, etc

## Deployment
Due to our project being developed in Godot we will not have a live version.

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
