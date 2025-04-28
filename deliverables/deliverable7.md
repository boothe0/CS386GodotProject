# Deliverable 7: Verification and Validation

## Description
Tiny Roguelite is a roguelite game that allows busy fans of the genre to play without having to make a large time commitment, providing a short-form version of the genre that still contains all the features found in a traditional rougelite game. This game allows players to complete a run in under twenty minutes while still being immersed in an engaging story and multiple rounds of combat. The game's combat system enables players to attack enemies with melee and ranged attacks, as well as keeping track of both the player's and the enemies' health and stamina. The player's main objective during a battle is to defend an object that is located at the center of the game arena from an onslaught of enemies who are moving in to attack from every direction. This constant onslaught of enemies combined with the stamina system requires the player to strategically attack based on their current strength and capabilites, adding difficulty to the game. Moreover, at the end of each round, the player can use the coins they collected from defeating enemies to purchase upgrades and consumables in the game's shop that increase their strength so that in future rounds they can attack enemies more efficiently.

## Verification

- Test framework: GUT (Godot Unit Test)
- [Automated unit tests](https://github.com/boothe0/CS386GodotProject/tree/main/cs386gameproject/tests/unit_tests)
- An example of a test case that makes use of mock objects:
    - [Mock objects used for testing](https://github.com/boothe0/CS386GodotProject/tree/main/cs386gameproject/tests/mock_objects)
    - [Test using the mock player as a target](https://github.com/boothe0/CS386GodotProject/blob/main/cs386gameproject/tests/mock_objects/player.gd)
    - This automated unit test checks that
      1. The player is taking the appropriate amount of damage
      2. The player dies when they are at or below 0hp
      3. The player heals the appropriate amount of damage
      4. The player recieves the correct amount of coins
      5. Coin counts are stored equally across all individual scripts
      6. Inside of the mock player, a mock coin count label is used to simulate the real in game label, which must also be equal to the other coin totals
- A print screen showing the result of the unit tests execution.

![testpass](https://github.com/user-attachments/assets/e44ba598-d374-441f-b386-c8e3a9895a60)



## Acceptance Test
- Framework: GUT
- Link to test: https://github.com/boothe0/CS386GodotProject/blob/deliverable-7/cs386gameproject/tests/acceptance_tests/test_move_up.gd
- In this test, I tried to test if the player character would move upwards on the screen. The player did not move within the alotted frames. This might be a failure on using GUT.
- ![testfail](https://imgur.com/2KwNPRs.png)


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

2. Brienne Harvey:
- The user missed the tutorial button the first time, went straight in to a game round, died, and then did the tutorial. Had to repeat the tutorial a couple of times because the text moved by too fast, and font was hard to read.
- The player got through a few rounds, but during those rounds, did not take into account the health, stamina, and mana bars, so would spam attacks. Barely used the dodge function. Did not notice the timer at the top, so was confused when the round would end, and change to the shop. Navigated the shop with minimal trouble. Again because of the font, it was bit difficult to read for them.
- Control of the character (moving, melle, and ranged attacks) was pretty good/smooth.
- Overall, not the best first impression from the user. Got fairly frusturated with the difficulty and accessibility of it. 

2. Melanie Nagel:
- The user moved through the tutorial relatively quickly, but needed to double-check the control instructions after missing a couple of mechanics (especially dodge and ranged attack).
- During the first full round, the user did well moving and attacking but took a lot of damage because they forgot to monitor stamina and mana usage.
- They made it to the shop after the second round, explored the items easily, and purchased a healing item, but forgot to actually use it in the next round.
- Overall, Melanie stayed pretty positive, was engaged, and laughed at some of the tougher enemy moments. She appreciated the flow of rounds even when she lost.

### Reflection
1. Willam Merrit:
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

2. Brienne Harvey:
- The tutorial was difficult to understand and the instructions flashed by too quickly to both be able to read and test out the action. The words were difficult to read.
- Rates the controls a 3. The potion action didn’t seem to do anything in the tutorial, so it was not helpful to know.
- Had no idea which bars corresponded with what. They were not helpful until the third try.
- Rates the shop a 4. The words describing the purchasable options were hard to read. It was also much too zoomed in. Could not read the big white letters that appeared when you walk near the shopkeeper. Items already purchased still appeared available after they were purchased. Was not sure if they had to buy objects again after dying or after each round. Did not understand how or when the shop would appear either.
- The white barriers around the center were hard to see. The floor is the same color and similar texture. There were multiple times they would try to shoot or walk through the walls. It wasn’t clear that there was a cool down after each sword swing. The opening story is blocked by the frame and it is typed in a font that is difficult to read. They did not understand that every object on the level floor was an obstacle right away.
- They couldn’t read it well, so they didn’t understand the narrative at all. The border design framing the story explanation was the same color as the story text, so it was hard to focus on the words that were written next to it. Also, they do not think “incensing” is the appropriate word to use, it looks like it was meant to say “incentivizing” but that is still clunky wording.
- Everything but the main character fits together. The main character doesn’t match the aesthetic of the rest of the game. The color palette of everything was disharmonious and looked boring. The “try again” screen was nice, everything should match that screen.
- They were mostly confused about the mechanics and goal of the game, so they were not engaged in the game itself as they were trying to figure out how to play.
- It was difficult because it wasn’t clear how to pass a level. The cool down made it difficult to fight foes.
- They have not played a roguelite game before.
- It was alright.
- They liked the greek myth references.
- They liked the gameplay of the game the least.
- To them, it didn’t seem very unique.
- A harmonious color palette and an accessible font. they would also like to see a menu that describes the controls available in game, outside of the tutorial. Possibly a button you can press that would bring up a pop-up.
- Not very likely.
- "If it looked nicer and the readability was better, I would consider playing it again."  

3. Melanie Nagel:
- The tutorial was mostly helpful but could be improved by having an option to manually "repeat" or "review" certain mechanics after finishing it, without needing to restart everything. Maybe a controls menu they can access mid-game.
- Rates the controls a 7. Movement and basic attacks were intuitive, but dodge could be better mapped (suggested something like double-tap movement key or a different hotkey).
- Thought the health, mana, and stamina bars were useful once she noticed them — initially forgot to check them because they are small and placed a bit high on the screen.
- Rates the shop a 9 for ease of use. Said it was straightforward, liked hovering over items to see the description and price. Minor note: wished you could preview what the item effect would actually look like after buying it.
- Minor confusion: Melanie said it was not obvious that stamina was limiting her ability to spam dodge or melee attacks at first. He suggested a quick pop-up or icon warning when you try to dodge without stamina.
- Found the narrative interesting but felt it needed "a little more spice" — suggested a short animated intro or more dialogue in-between rounds.
- Described the art style as "retro cartoonish" and said it fit the overall mood, although she thought adding a little more color contrast between enemies and background would help in hectic moments.
- Rated engagement pretty highly. Said it was "easy to lose track of time in a good way" once she got into the rhythm of dodging and fighting.
- Felt the first round was a little too easy, but by the second or third round, things escalated nicely. Appreciated the challenge curve but recommended spawning new enemy types earlier.
- Melanie has played a few roguelites like Enter the Gungeon and Hades, and said this game felt much more "bite-sized" and accessible, more focused on short play sessions rather than big commitment runs.
- Thought the playtime was "just right" for casual sessions. Mentioned this would be a good game to play "when you have 10–15 minutes."
- Favorite feature: the shop items and upgrades. Liked seeing tangible improvements between rounds and said it made progression satisfying.
- Least favorite feature: no clear indicator when you were out of stamina mid-combat. Sometimes it looked like the game ignored her inputs but it was actually a stamina issue.
- Unique aspect: said the mini-round based structure (short rounds plus a shop phase) felt different from other roguelites that usually have long continuous runs.
- Wished there were "more dramatic" ultimate abilities or power-ups you could earn across multiple rounds (kind of like building up a super move after doing well).
- Very likely to play again.
- Said she'd love to see daily challenges or randomized enemy modifiers in future updates to keep it fresh over time.






## Teamwork

- Asher (16.7%) - Verification
- Chandler (16.7%) - Acceptance
- Camelia (16.7%) - Script for validation
- Elizabeth (16.7%) - Results and reflection for user #1, William Merritt
- Maya (16.7%) - Results and reflection for user #2, Brienne Harvey
- Ethan (16.7%) - Results and reflection for user #3, Melanie Nagel
