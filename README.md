## Gilded Rose Kata - Ruby


- Task is to refactor existing code so that it is neat and making additions to it are simple.

## Description of the logic:

All items have a SellIn value which denotes the number of days we have to sell the item. 

All items have a Quality value which denotes how valuable the item is.
 
 At the end of each day our system lowers both values for every item. Pretty simple, right? 
 Well this is where it gets interesting:

-Once the sell by date has passed, Quality degrades twice as fast
-The Quality of an item is never negative
- "Aged Brie" actually increases in Quality the older it gets
- The Quality of an item is never more than 50
-  "Sulfuras", being a legendary item, never has to be sold or decreases in Quality
- "Backstage passes", like aged brie, increases in Quality as it's SellIn value approaches; 
	Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but Quality drops to 0 after the concert
- We have recently signed a supplier of conjured items. This requires an update to our system:

- "Conjured" items degrade in Quality twice as fast as normal items
- Feel free to make any changes to the UpdateQuality method and add any new code as long as everything still works correctly. However, do not alter the Item class or Items property as those belong to the goblin in the corner who will insta-rage and one-shot you as he doesn't believe in shared code ownership (you can make the UpdateQuality method and Items property static if you like, we'll cover for you)."*


### Planning

1. First step of tackling this KATA is understanding how it works and what the nested if statements mean.

2. Start testing for the easiest cases of always increasing in quality /etc to see where you can refactor and make changes

3. Pulling out new methods that are within the update quality method : 

- Update age method - always decreases age by one, unless the product is 'Sulfuras, Hand of Ragnaros'
- Increase the quality of the product as long as the quality is less than < 50, however if the name is 'Sulfuras, Hand of Ragnaros' - quality can go up higher
- Decrease the quality - quality goes down by one as long as the quality is not negative, however if the product is 'Sulfuras, Hand of Ragnaros' the quality does not go down

4. Refactoring the main code:

- Reversing the if statement to start with positives- if name == Brie and name == Backstage passes, then the quality increases
- the age will always decrease, unless the name is Sulfuras, hand of Ranaros
- Brie will always only increase in its quality- no matter what
- Can now potentially create a method update - that calls two methods inside it : - updating age and updating quality

##  Diagram of Logic:

- the age always decreases, unless its a Sulfras product

![Alt text](diagram.png)

