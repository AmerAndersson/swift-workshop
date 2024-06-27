# DiceGame

```swift
The DiceGame class implements a game where each player takes a turn rolling dice, and the player who rolls the highest number wins the round. It uses a linear congruential generator from the example earlier in the chapter, to generate random numbers for dice rolls.

The DiceGame.Delegate protocol can be adopted to track the progress of a dice game. Because the DiceGame.Delegate protocol is always used in the context of a dice game, it’s nested inside of the DiceGame class. Protocols can be nested inside of type declarations like structures and classes, as long as the outer declaration isn’t generic. For information about nesting types, see Nested Types.

To prevent strong reference cycles, delegates are declared as weak references. For information about weak references, see Strong Reference Cycles Between Class Instances. Marking the protocol as class-only lets the DiceGame class declare that its delegate must use a weak reference. A class-only protocol is marked by its inheritance from AnyObject, as discussed in Class-Only Protocols.

DiceGame.Delegate provides three methods for tracking the progress of a game. These three methods are incorporated into the game logic in the play(rounds:) method above. The DiceGame class calls its delegate methods when a new game starts, a new turn begins, or the game ends.

Because the delegate property is an optional DiceGame.Delegate, the play(rounds:) method uses optional chaining each time it calls a method on the delegate, as discussed in Optional Chaining. If the delegate property is nil, these delegate calls are ignored. If the delegate property is non-nil, the delegate methods are called, and are passed the DiceGame instance as a parameter.
```
