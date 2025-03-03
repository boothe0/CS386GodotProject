# Deliverable 3: Analysis

In this deliverable, report the results of the software analysis for your project. Use the following sections to structure your deliverable.

## System Description

The problem of no short form roguelite being available affects busy fans of the genre who don't have the time to play long runs, the impact of which is that players lack the time to play games they enjoy. For busy roguelite game fans who have limited time to enjoy roguelites, the Tiny Roguelite is a roguelite that presents a short form version of a roguelite game. Unlike other games such as The Binding of Isaac, Gungeon, or Slay the Spire, which take up to an hour or more to complete a single run, our product takes much less time to play through for those who do not have the time to commit to a run of those longer-form games. Overall, Tiny Roguelite is a roguelite game that allows busy fans of the genre to play their favorite genre without requiring a large time commitment, providing a short-form game with all the features of traditional games in the same genre.

It should take less than 20 minutes to play through a run of the game, keeping it short for players with limited free time. There is a **leaderboard** at the end of each round that totals points earned and the time the player completed the round in. The **player** can go to a shop to ***purchase*** **upgrades** and **consumables**, which are both **shop items** that are purchasable for a specified *price* and increase player strength. Moreover, item drops including both currency and **consumables** can be dropped from **enemies** when defeated. The game contains a shop area that allows players to *buy* items using currency after they have completed a round.  

Both the **player** and the **enemies** in the game are **entities** that ***have*** a **health bar** , which displays their *maximum health* and *current health*. Furthermore, the **player** has a **stamina bar** which displays their *maximum stamina* and *current stamina*. The **player** *uses* **projectile attacks** , which have a *range speed* and *range damage*, and **melee attacks** , which have a *melee speed* and *melee damage*. Adding a defense objective in the center of the arena gives an objective to the player, increasing difficulty. **Enemies** move to attack the central objective and damage the player if they draw attention. **Consumables** provide stat bonuses for the **player** and **upgrades** *apply* special effects such as health potions for **consumables** and increased attack range. 


## Model


![UML of Tiny Roguelike](https://i.imgur.com/ED8rbQK.png)
