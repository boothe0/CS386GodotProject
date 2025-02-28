# Deliverable 3: Analysis

In this deliverable, report the results of the software analysis for your project. Use the following sections to structure your deliverable.

## System Description
Provide a brief textual description of your system. The first paragraph of the description must contain the problem statement, the product position statement, and the value proposition of your system (you can refine/update what you presented in D.2). The following paragraphs should describe the key requirements of the system. This description should be consistent with D.2 stakeholders, requirements, use cases, and user stories. Again, refinements/updates are welcome since your understanding of the system is constantly evolving. 

Use Bold every time that you use a noun that is a class in your model. Use Italic every time that you use a noun that is an attribute in your model. Use Bold and Italic every time that you use a noun or verb that is an association in your model. 

Grading criteria (5 points): The description should be clear, concise, and well-written, free of typos and grammar problems. The use of bold, italic, and underline should be coherent with the model presented in Section 2---all classes, attributes, and associations from the model should appear in the text and their role in the system, as described in the text, should be consistent with the model.  


The problem of no short form roguelite being available affects busy fans of the genre who don't have the time to play long runs, the impact of which is that players lack the time to play games they enjoy. For busy roguelite game fans who have limited time to enjoy roguelites, the Tiny Roguelite is a roguelite that presents a short form version of a roguelite game. Unlike other games such as The Binding of Isaac, Gungeon, or Slay the Spire, which take up to an hour or more to complete a single run, our product takes much less time to play through for those who do not have the time to commit to a run of those longer-form games. Overall, Tiny Roguelite is a roguelite game that allows busy fans of the genre to play their favorite genre without requiring a large time commitment, providing a short-form game with all the features of traditional games in the same genre.
It should take less than 20 minutes to play through a run of the game, keeping it short for players with limited free time. There is a leaderboard at the end of each round that totals points earned and the time the player completed the round in. The player can go to a shop to purchase upgrades and consumables, which are both shop items that are purchasable for a specified price and increase player strength. Moreover, item drops including both currency and consumables can be dropped from enemies when defeated. The game contains a shop area that allows players to buy items using currency after they have completed a round.  
Both the player and the enemies in the game are entities that have a health bar, which displays their maximum health and current health. Furthermore, the player has a stamina bar which displays their maximum stamina and current stamina. The player uses projectile attacks, which have a range speed and range damage, and melee attacks, which have a melee speed and melee damage. Adding a defense objective in the center of the arena gives an objective to the player, increasing difficulty. Enemies move to attack the central objective and damage the player if they draw attention. Consumables that stat bonuses and Upgrades that apply special effects such as health potions for consumables and increased attack range for upgrades. 



## Model
Provide the conceptual model of your system as a UML class diagram. Represent proper cardinalities (multiplicities) for all associations. Also include the association names. 
 
Some points to consider:

Use UML adequately. Do not use graphical elements that are not part of the language. Represent compositions and aggregations when relevant.
- This model is not an ER diagram (entity-relationship model), which is focused on relational database systems. However, both diagrams have similarities.
- Do not overcomplicate how you represent the elements of your model (e.g., using inheritance or an association when they are not necessary). Pay attention to simplicity, maintainability, unnecessary repetition, cohesion, and coupling.
- Do not represent actions that don’t need to be registered in the system.
- Do not represent technical elements, such as user interface or programming language libraries in the model. At this point, we are modeling the business logic/domain of your system. During the design phase, the model will be refined to include technology-specific elements and decisions.
- Do not represent "System" as a class in your model. Everything that you are modeling is part of the system.
- If you feel the need to justify your decisions, you can write your rationale in this section or as UML comments in the diagram.
- The model must have at least 8 classes. You can add requirements in the system description if you need more classes.

![UML of Tiny Roguelike](https://i.imgur.com/RuDEzNZ.png)

Grading criteria (25 points): You should correctly use the UML specification. Your model should have the minimum number of classes. Your domain should be adequately modeled. The model should avoid unnecessary complexity, repetition, lack of cohesion, and coupling. The classes should be at an adequate abstraction level.

