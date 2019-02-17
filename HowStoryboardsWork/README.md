#  How Storyboards work

A storyboard is a collection of view controller nibs, which are displayed as its scenes. Each view controller is instantiated from its own nib, as needed, and will then obtain its view, as needed — typically from a view nib that you’ve configured in the same scene by editing the view controller’s view.

 A storyboard typically uses the third approach to supply a view controller with its view: the view is loaded from a nib. But the storyboard conceals the nib so that you don’t see it as a separate file. In fact, the nib isn’t even created until you build the app. At that moment, the storyboard is compiled into a .storyboardc bundle, and each scene in the storyboard, representing a view controller and its view, is split into two nibs:
 
As a result of this architecture, a storyboard has all the memory management advantages of nib files: none of these nib files are loaded until the instances that they contain are needed, and they can be loaded multiple times to give additional instances of the same nib objects. At the same time, you get the convenience of being able to see and edit a lot of your app’s interface simultaneously in one place.

a view controller can be instantiated from a storyboard in various ways:

**1. Manual instantiation**: Your code can instantiate a view controller manually from a storyboard, by call‐ ing one of these methods:

- instantiateInitialViewController
- instantiateViewController(withIdentifier:)

**2. Initial view controller**: If your app has a main storyboard, as specified by its Info.plist, that storyboard’s initial view controller will be instantiated and assigned as the window’s rootView- Controller automatically as the app launches. 

**3. Relationship**: Two built-in parent view controllers can specify their children directly in the storyboard, setting their viewControllers array:

- UITabBarController can specify multiple children (its “view controllers”).
- UINavigationController can specify its single initial child (its “root view controller”).

To add a view controller as a `viewControllers` child to one of those parent view controller types, `Control-drag` from the parent view controller to the child view controller; in the little HUD that appears, choose the appropriate listing under *Relationship Segue*. The result is a relationship whose source is the parent and whose destination is the child. The destination view controller will be instantiated automatically when the source view controller is instantiated, and will be assigned into its `viewControllers` array, thus making it a child and retaining it.

**4. Triggered segue**: A triggered segue configures a future situation, when the segue will be triggered. At that time, one view controller that already exists will cause the instantiation of another, bringing the latter into existence automatically. Two types of triggered segue are particularly common (their names in the nib editor depend on whether the “Use Trait Variations” checkbox is checked in the File inspector):

- *Show (formerly Push)*: The future view controller will be pushed onto the stack of the navigation controller of which the existing view controller is already a child.
The name Show comes from the show(_:sender:) method, which pushes a view controller onto the parent navigation controller if there is one, but *behaves adaptively* if there is not. A Show segue from a view controller that is not a navigation controller’s child will present the future view controller rather than pushing it, as there is no navigation stack to push onto. Setting up a Show segue without a navigation controller and then wondering why there is no push is a common beginner mistake.

- *Present Modally (formerly Modal)*: The future view controller will be a presented view controller (and the existing view controller will be its original presenter).

Unlike a relationship, a triggered segue does not have to emanate from a view controller (a manual segue). It can emanate from certain kinds of gesture recog‐ nizer, or from a tappable view, such as a button or a table view cell, in the first view controller’s view; this is a graphical shorthand signifying that the segue should be triggered, bringing the second view controller into existence, when a tap or other gesture occurs (an action segue). 

To create a triggered segue, Control-drag from the tappable object in the first view controller, or from the first view controller itself, to the second view control‐ ler. In the little HUD that appears, choose the type of segue you want.

- *If you dragged from the view controller, this will be a manual segue;*
- *if you dragged from a tappable object, it will be an action segue.*

## Triggered Segue
A triggered segue is a true segue (as opposed to relationships, which are not really segues at all). The most common types are Show (Push) and Present Modally (Modal). A segue is a full-fledged object, an instance of UIStoryboardSegue, and it can be configured in the nib editor through its Attributes inspector. However, it is not instantiated by the loading of a nib, and it cannot be pointed to by an outlet. Rather, it will be instantiated when the segue is triggered, at which time its designated initializer will be called, namely init(identifier:source:destination:).

A segue’s source and destination are the two view controllers between which it runs. The segue is directional, so the source and destination are clearly distinguished. The source view controller is the one that will exist already, before the segue is triggered; the destination view controller will be instantiated when the segue is triggered, along with the segue itself.

A segue’s identifier is a string. You can set this string for a segue in a storyboard through its Attributes inspector; that’s useful when you want to trigger the segue manually in code (you’ll specify it by means of its identifier), or when you have code that can receive a segue as parameter and you need to distinguish which segue this is.

You can further customize a triggered segue’s behavior by providing your own UIStoryboardSegue subclass. The key thing is that you must implement your custom segue’s perform method, which will be called after the segue is triggered and instantiated, in order to do the actual transition from one view controller to another. You can do this even for a push segue or a modal segue: in the Attributes inspector for the segue, you specify your UIStoryboardSegue subclass, and in that subclass, you call super in your perform implementation.


## Unwind Segues

Here’s an interesting puzzle: Storyboards and segues would appear to be useful only half the time, because segues are asymmetrical. There is a push segue but no pop segue. There is a present modally segue but no dismiss segue.

The reason, in a nutshell, is that a triggered segue cannot “go back.” A triggered segue instantiates the destination view controller; it creates a new view controller instance. But when dismissing a presented view controller or popping a pushed view controller, we don’t need any new view controller instances. We want to return, somehow, to an existing instance of a view controller.

Beginners sometimes make a triggered segue from view controller A to view controller B, and then try to express the notion “go back” by making another triggered segue from view controller B to view controller A. The result is a vicious cycle of segues, with presentation piled on presentation, or push piled on push, one view controller instantiated on top of another on top of another. Don’t do that. 

The solution is an unwind segue. An unwind segue does let you express the notion “go back” in a storyboard. Basically, it lets you jump to any view controller that is already instantiated further up your view controller hierarchy, destroying the source view controller and any intervening view controllers in good order.

**Creating an unwind segue**

Before you can create an unwind segue, you must implement an unwind method in the class of some view controller represented in the storyboard. This should be a method marked @IBAction as a hint to the storyboard editor, and taking a single parameter, a UIStoryboardSegue. You can call it unwind if you like, but the name doesn’t really matter:

```swift
@IBAction func unwind(_ seg: UIStoryboardSegue) {
// ...
}
```
Think of this method as a marker, specifying that the view controller in which it appears can be the destination for an unwind segue. It is, in fact, a little more than a marker: it will also be called when the unwind segue is triggered. But its marker func‐ tionality is much more important . in many cases, you won’t give this method any code at all. Its presence, and its name, are what matters.

Now you can create an unwind segue. Doing so involves the use of the Exit proxy object that appears in every scene of a storyboard. This is what the Exit proxy is for! Control-drag from the view controller you want to go back from, or from something like a button in that view controller’s view, connecting it to the Exit proxy object in the same scene. A little HUD appears, listing all the known unwind methods (similar to how action methods are listed in the HUD when you connect a button to its target). Click the name of the unwind method you want. You have now made an unwind segue, bound to that unwind method.

**How an unwind segue works**

When the unwind segue is triggered, the following steps are performed:

1. If this is an action segue, the source view controller’s shouldPerformSegue(with- Identifier:sender:) is called — just as for a normal segue. This is your chance to stop the whole process dead at this point by returning false.

2. The name of the unwind method to which the unwind segue is bound is only a name. The unwind segue’s actual destination view controller is unknown! Therefore, the runtime now starts walking up the view controller hierarchy looking for a destination view controller. Put simply, the first view controller it finds that implements the unwind method will, by default, be the destination view controller.

Assume now that the destination view controller has been found. Then the runtime proceeds to perform the segue, as follows:

1. The source view controller’s prepare(for:sender:) is called with the segue as the first parameter — just as for a normal segue. The two view controllers are now in contact (because the other view controller is the segue’s destination). This is an opportunity for the source view controller to hand information to the destination view controller before being destroyed! (Thus, an unwind segue is an alternative to delegation as a way of putting one view controller into communica‐ tion with another.

2. The destination view controller’s unwind method is called. Its parameter is the segue. The two view controllers are now in contact again (because the other view controller is the segue’s source). It is perfectly reasonable for the unwind method body to be empty; the unwind method’s real purpose is to mark this view controller as the destination view controller.

3. The segue is actually performed, destroying the source view controller and any intervening view controllers up to (but not including) the destination view con‐ troller, in good order.

**How the destination view controller is found**

The process of locating the destination view controller starts by walking up the view controller hierarchy. What do I mean by “up” the hierarchy? Well, every view controller has either a parent or a presentingViewController, so the next view controller up the hierarchy is that view controller. However, it might also be necessary to walk back down the hierarchy, to a child (at some depth) of one of the parents we encounter. Here’s how the walk proceeds:

1. At each step up the view controller hierarchy, the runtime sends this view con‐ troller the following event: `allowedChildrenForUnwinding(from:)`.  This view controller’s job is to supply an array of its own direct children. The array can be empty, but it must be an array. To help form this array, the view controller calls `childContaining(_:)` This tells the view controller which of its own children is, or is the ultimate par‐ ent of, the source view controller. We don’t want to go down that branch of the view hierarchy; that’s the branch we just came up. So this view controller subtracts that view controller from the array of its own child view controllers, and returns the resulting array.
2. There are two possible kinds of result from the previous step
    1. *There are children*: If the previous step yielded an array with one or more child view controllers in it, the runtime performs step 1 on all (stopping if it finds the des‐ tination), thus going down the view hierarchy.
    2. *There are no children*: If on the other hand, the previous step yielded an empty array, the runtime asks this same view controller the question: `canPerformUnwindSegueAction(_:from:withSender:)` . The default implementation of this method is simply to call responds(to:) on self, asking whether this view controller contains an implementation of the unwind method we’re looking for. The result is a Bool. If it is true, we stop. This is the destination view controller. If it is false, we continue with the search up the view controller hierarchy, finding the next view controller and performing step 1 again.
