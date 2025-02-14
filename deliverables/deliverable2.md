In this deliverable, you will report the results for the requirements engineering for your product. Structure your deliverable using the following sections. When preparing your deliverable, don't add the explanation text from this document. 
1. Positioning
Problem statement

Provide a statement to summarize the problem solved by your project according to the following structure (which is based on the OpenUP Vision Template):

The problem of
No short form roguelike being available 
affects
busy fans of the genre, who don't have the time to play long runs
the impact of which is
players being unable to enjoy their favorite genre

Example of a problem statement: “The problem of inefficient prioritization of homework assignments affects college students; the impact of which is delivering assignments past due and receiving low grades.” The problem should read as a problem (must be something bad that makes people spend time or money in an inefficient way.
Product Position Statement

A product position statement communicates the intent of the application and the importance of the project to all concerned personnel. The product should mitigate the aforementioned problem. Provide a statement according to the following structure:

For
Busy Roguelite fans
Who
have limited time to enojy roguelites
The Tiny Roguelite
Tiny Roguelie is a Roguelite
That
presents a short form version of a rouge-lite game
Unlike
other games such as  The Binding of Isaac, Gungeon, or Slay the Spire which take upto an hour+ to complete a single run.
Our product
takes much less time to playthrough for those who do not have the time to commit to a run of those longer-form games.

Example of a product position statement: “For college students who have many parallel homework assignments, MyPrioritizationApp is a planning app that crowdsources the identification of complexity and time necessary to accomplish assignments, supporting the informed prioritization; unlike myHomework Student Planner, our product does not rely on the judgment of a student who hasn’t started the homework yet.” Make sure your product position statement is related to your problem.
Value proposition and customer segment

Report the value propositions and customer segments of your product. Make sure that your value proposition is coherent with the product position statement and contains the following elements: i) what your product is; ii) the target customer; iii) the value your product provides; and iv) why your product is unique.

Example:
Value proposition: MyPrioritizationApp is a crowdsourced planning app {(i) what your product is} that allows college students {(ii) target costumer} to make better use of their time {(iii) the value your product provides}, prioritizing homework based on more accurate information of required time and complexity of the assignments {(iv) why your product is unique}.”
Consumer segment: College students who have many parallel homework assignments

Value proposition: Tiny Roguelite is a roguelite game that allows busy fans of the genre to play their favorite genre without requiring a large time commitment, providing a short-form game with all the features of traditional games in the same genre.
Consumer segment: Busy Roguelite Fans with little time. 

Grading criteria (3 points, 1 for each section): The content of the subsections should contain all the required elements, follow the provided template, and be consistent with each other. The text should not contain typos or grammar issues.
2. Stakeholders

Make a list of all stakeholders of the project with a brief description of each one of them, emphasizing any responsibilities with the project. Examples of stakeholders include users, clients, competitors, detractors, developers, etc.

- Casual fans of the roguelike genre

- Busy die hard fans of the roguelite genre

- Other companies that develop roguelike games

- Content creators that cover roguelikes

Grading criteria (1 point): The stakeholders can’t be too generic or specific. The list should reflect what was described in Section 1.
3. Functional requirements (features)

Make a numbered list of requirements for your software. Just self-explanatory titles are enough at this point. Remember that requirements should deliver the value proposition and they must be consistent with the interviews you performed for the previous deliverable. You can talk again to your clients to help define the requirements. While writing the requirements, focus on the capabilities needed and not on how they should be implemented.

1. Takes less than 20 minutes to play through a run
2. Upgrades
3. Combat system
   - Health
   - Melee Attacks
   - Ranged Attacks
   - Stamina Management
   - Mana Management
4. Defense Objective
5. Enemies
6. Consumables
7. Intuitive UI
8. Currency (gold/credits)
9. Item Drops
   - Consumables
   - Gold
10. A shop
11. Lore
12. Tutorial


Grading criteria (2 points): The list should be comprehensive (remember that you are not expected to implement all the requirements by the end of the course but you should list them). Follow the same pattern to describe all the requirements. The list of requirements should be coherent with the previous sections.
4. Non-functional requirements
Make a numbered list of non-functional requirements that are important for your software. Explain their importance. Follow the terminology of ISO/IEC 25010:2011. For each non-functional requirement, give an objective goal/measurement in order to provide verifiability for the requirement. You can find more details at the following URL:
https://ieeexplore.ieee.org/document/8559686

1. Code Standards
   - code is properly commented to explain snippet functionality
   - all onready variables grouped together
   - scripts should not exceed 600 lines of code
2. Accessability
   - Simple to understand UI that new players can click through
   - clear indications on how to play
3. Performance
    - no lagspikes
    - no loading time over 5 seconds that user cannot cancel
4. Compatability
   - playable Windows
   - playable Linux
   - playable MacOS
5. Scalability
   - modular design
   - easy to add new upgrades/consumables
6. Maintainability
   - easy to add new code or features without introducing bugs
   - ability to maintian pace of code production

Grading criteria (2 points): Follow the ISO-IEC terminology, explain why they are important, provide verifiability criteria for each requirement.
5. Minimum Viable Product

What will be your MVP? Which features are you going to validate? How?

1. Combat
   - Unit test ranged attacks shoot projectiles
   - Unit test melee attacks hit in a cone in front of player
   - Unit test ensures hit collision
   - Unit test ensuring stamina and mana used without bugs allowing reduced or no cost
   - Central objective
2. Consumables
   - health potion, mana potion, speed potion, attack speed potion
   - Unit test check each consumable provides the specified effect with the specified potentcy
3. Enemies
   - Unit test Should attack player
   - Unit test Should attack core objective
   - Unit test pathfinding toward core objective
   - Unit test pathfinding toward player when provoked
   - Unit test continues pathfinding toward core after player leaves aggro
4. Shop
   - Unit test random Items available for purchase
   - unit test Items give run bonuses when purchased
   - unit test Gold is taken from player
   - unit test Player cannot spend more than they own
   - unit test item shows in player inventory


Grading criteria (2 points): Describe what would be considered the Minimal Viable Product and how it will be tested (e.g., via implementation, prototyping, Wizard of Woz, etc.). Make clear what you are going to validate. The MVP should be coherent with the previous sections.
6. Use cases

Include a UML use case diagram for your project. There are many drawing tools that you can use.  I recommend the one we used in class, draw.io.

Grading criteria (5 points): Follow correctly the UML specification. The actors should be coherent with what was listed in sections 1 and 2. The use case diagram should be coherent with the list of requirements (section 3). The level of granularity of each use case should be adequate. The use cases should be adequately named.

Present one complete use case description (textual) for each member of the group. Therefore, if the group has 4 members, 4 use case descriptions are necessary. As the grading will not be individual, the group is responsible for keeping the quality and consistency of the whole document – avoid just splitting the work. Choose the most important use cases to describe. Follow the template provided in the slides.

1. Main menu
2. Ranged Combat
3. Melee Combat
4. Consumables
5. Shop interface


After each use case description, add a sketch of the corresponding user interface. This will be a good opportunity to start thinking about usability. 

Grading criteria (8 points): Follow the template to describe the use cases. Present an interface sketch for each use case. Describe the use case as a dialog between the user and the system. Do not use UI language in the description of the use case.
7. User stories

Write two user stories for each member of the group. They can be related to the same features described in the use cases or to different ones. Adopt the following format: "As a <ROLE>, I want <SOMETHING> so that <GOAL>." 

Establish a priority level for each user story and estimate how many hours each one will demand using the planning poker approach. 

Grading criteria (6 points): Use the provided format. The user stories should be in an adequate level of granularity (not too broad nor too specific). Provide the priority and estimation for each user story.
8. Issue Tracker

The user stories should be registered in your GitHub issue tracker. Include here the link for your issue tracker and a screenshot of what you did. 

Grading criteria (1 point): Provide the URL and screenshot of the issue tracker. The user stories should be registered there.
Format

Your document should be composed in Markdown and hosted on GitHub but you should also turn in a PDF copy to be graded.  See also Converting GitHub Markdown to PDF.  Sections should use appropriate markdown and figures should be included if needed or appropriate.
Teamwork

The contribution of each team member may be different but we expect the amount of work to be roughly even.  When you submit the deliverable, the person submitting the deliverable should describe what each member worked on and a rough percentage estimation of their contribution as a submission comment. Here's an example:

    John Doe (40%) – Conducted 2 interviews, wrote section 2.3, and reviewed the whole document.
    Mary Shawn (40%) – Conducted 1 interview, wrote sections 1 and 2.1, reviewed section 2.3, and worked on the source code.
    Lucy Johnson (20%) – Wrote section 2.2 and performed code review.

We will also be reviewing your github repository, which should also reflect the work happening in your team.  Every team member should be committing and making meaningful contributions in your repository.

Individual grades may be reduced based on a combination of what we see in the deliverable summary and github contributions.  If there's no evidence that a team member contributed to the deliverable, they should absolutely expect to receive a zero!
