# Deliverable 7: Verification and Validation

## Description

## Verification

- Test framework: GUT (Godot Unit Test)
- ![Autmated unit tests](https://github.com/boothe0/CS386GodotProject/tree/main/cs386gameproject/tests/unit_tests)
- An example of a test case that makes use of mock objects:
    - ![Mock objects used for testing](https://github.com/boothe0/CS386GodotProject/tree/main/cs386gameproject/tests/mock_objects)
    - ![Test using the mock player as a target](https://github.com/boothe0/CS386GodotProject/blob/main/cs386gameproject/tests/mock_objects/player.gd)
    - This automated unit test checks that
      1. The player is taking the appropriate amount of damage
      2. The player dies when they are at or below 0hp
      3. The player heals the appropriate amount of damage
      4. The player recieves the correct amount of coins
      5. Coin counts are stored equally across all individual scripts
      6. Inside of the mock player, a mock coin count label is used to simulate the real in game label, which must also be equal to the other coin totals
- A print screen showing the result of the unit tests execution. 



## Acceptance Test

## Validation

### Script
**Tasks for the user:**
- Open the game
- Play through game tutorial
- Start actual game
- Move player character around the game board
- Make a melee attack
- Make ranged attack
- Dodge an attack
- Collect coins from an enemy
- If user reaches shop scene:
  - Interact with all of the available shop items to view price and description
  - Purchase an item
  - Begin a new game round
  - Use item in the following game round
- If user reaches death scene: 
  - Begin a new game round
 
**Questions:**
- How effective was the tutorial in helping you learn the controls for the game?
- On a scale of one to ten, with one being very difficult and ten being very easy, how easy would you say it was to use the controls for the game?
- How useful were the health, mana, and stamina bars for the player character in helping you play the game? 
- On a scale of one to ten, with one being very difficult and ten being very easy, how easy would you say it was to utilize the game shop?
- Was there any aspect of the gameplay that confused you, and if so, what was it?
- How did you feel about the narrative of the game?
- How would you describe the art style of the game?
- How engaging would you say the game was?
- Did you feel it was either too easy or too difficult to play through a round? If so, why?
- Have you played roguelite games before, and if so, how did this gameplay experience compare to that of longer-form roguelites?
- Did you feel that the amount of time required to play this game was too long, too short, or just right?
- What feature or aspect of this game did you like the most?
- What feature or aspect of this game did you like the least?
- Were there any features or aspects of this game that made it unique in comparison to other games you've played, and if so, what were they?
- Are there any features you wish this game had that it didn't, and if so, what are they?
- How likely would you be to play this game again?
- (If they say unlikely or seem on the fence) Is there anything we could change about this game that would make you more likely to play it again?



**Types of data collected:**
- Users' answers to the script questions
- The length of time that users take to play through the tutorial
- The success of users in playing their first round
- Users' ability to effectively use the game controls
- The overall observed reactions and emotions of users throughout the gameplay experience

### Results 

1. Willam Merrit: 
- The user took not much time to go through the tutorial.
- The player got through a few rounds but when the ranged enemies started making it a "bullet hell" they struggled without the functional consumables.
- They were able to control the player very well and seemed inutitive overall.
- They were really impressed but at times got a bit upset with the difficulty of some of the enemies. They were drawn to the ranged combat.

### Reflection
1. Willam Merrit
- It doesnt tell you that you can left click to hit things only E. It does not give you an objective that you are supposed to defend the middle.
- Killing the middle objective does not end the game
- Very easy to control
- Put the bars in the bottom of the screen bigger and more art instead of bars for shield/health. Bars are overall not great, Maybe make them beakers
and one is red and one is blue with one actual shield. Make beaker shrink/fill up.
- The shop is very easy. 
- The goal of the game. Change font color of intro text to read easier. Remove the paragraph center the text and separate the lines of text.
- Inciting not incensing in the intro. Rework of the intro.
- Yes the art style is very nice.
- Excited to see continued development.
- Right in the middle because everything goes to the middle and not everything attacks you. 
- No comment/unsure because the answer is too broad/complex.
- A little too short for now. Enemies do not come out faster, no new types.
- Upgrades are nice that is unique as usually those are not in the shop and those are set.
- Lack of options, more durable shield, mana, etc. Take the cabinets and put the upgrades the player bought and turn one of the cabinents to fill in 
as a color of the upgrade you bought. It shows progression more.
- "The upgrades were very unique I have played a lot of rougelites and never seen straight up upgrades in the shop"
- Adding in the upgrades showing up in the shop as a sense of progression.
- Very likely to play again and excited to see where it goes.
- Said they would buy it if fully fleshed out for 5-10 bucks. Nerf the ranged guys. Maybe add hearts for the hp bar (legend of zelda fan).

























## Teamwork
