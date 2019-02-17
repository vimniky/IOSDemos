#  Custom View Controller Transition

You can customize certain built-in transitions between view controller views:

**Tab bar controller**
When a tab bar controller changes which of its child view controllers is selected, by default there is no view animation; you can add a custom animation.

**Navigation controller**
When a navigation controller pushes or pops a child view controller, by default there is a sideways sliding view animation; you can replace this with a custom animation.

**Presented view controller**
When a view controller is presented or dismissed, there is a limited set of built-in view animations; you can supply a custom animation. Moreover, you can customize the ultimate size and position of the presented view, and how the pre‐ senting view is seen behind it; you can also provide ancillary views that remain during the presentation.

A custom transition animation can optionally be interactive: instead of tapping and causing an animation to take place, the user performs an extended gesture and gradu‐ ally summons the new view to supersede the old one. The user can thus participate in the progress of the transition. A familiar example is the Photos app, which lets the user pinch a photo, in a navigation controller, to pop to the album containing it.

A custom transition animation can optionally be interruptible. You can provide a way for the user to pause the animation, possibly interact with the animated view by means of a gesture, and then resume (or cancel) the animation.

## Noninteractive Custom Transition Animation

In the base case, you provide a custom animation that is not interactive. Configuring your custom animation requires three steps:

1. Before the transition begins, you must have given the view controller in charge of the transition a delegate.
2. As the transition begins, the delegate will be asked for an *animation controller*. You will supply a reference to some object adopting the `UIViewControllerAnimatedTransitioning` protocol (or nil to specify that the default animation, if any, should be used).
3. The animation controller will be sent these messages:
    - `transitionDuration(using:)`: The animation controller must return the duration of the custom animation.
    - `animateTransition(using:)`: The animation controller should perform the animation.
    -  `interruptibleAnimator(using:)`: Optional; if implemented, the animation controller should return an object adopting the UIViewImplicitlyAnimating protocol, which may be a property animator.
    - `animationEnded(_:)`: Optional; if implemented, the animation controller may perform cleanup fol‐ lowing the animation.

## Interactive Custom Transition Animation

With an interactive custom transition animation, the idea is that we track something the user is doing, typically by means of a gesture recognizer form the “frames” of the transition in response.

To make a custom transition animation interactive, you supply, in addition to the animation controller, an interaction controller. This is an object adopting the `UIViewControllerInteractiveTransitioning` protocol. (This object needn’t be the same as the animation controller, but it often is, and in my examples it will be.) The runtime then calls the interaction controller’s `startInteractiveTransition(_:)` instead of the animation controller’s `animateTransition(using:)`.

Configuring your custom animation requires the following steps:

1. Before the transition begins, you must have given the view controller in charge of the transition a delegate.
2. You’ll have a gesture recognizer that tracks the interactive gesture. When the gesture recognizer recognizes, it triggers the transition to the new view controller.
3. As the transition begins, the delegate will be asked for an animation controller. You will return a UIViewControllerAnimatedTransitioning object.
4. The delegate will also be asked for an interaction controller. You will return a `UIViewControllerInteractiveTransitioning` object (or nil to prevent the transition from being interactive). This object implements `startInteractiveTransition(_:)`.
5. The gesture recognizer continues by constantly calling `updateInteractiveTransition(_:)` on the transition context, as well as managing the frames of the animation.
6. Sooner or later the gesture will end. At this point, we must decide whether to declare the transition completed or cancelled. A typical approach is to say that if the user performed more than half the full gesture, that constitutes completion; otherwise, it constitutes cancellation. We finish the animation accordingly.
7. The animation is now completed, and its completion function is called. We must call the transition context’s `finishInteractiveTransition` or `cancelInteractiveTransition`, and then call its `completeTransition(_:)` with an argument stating whether the transition was finished or cancelled.
8. Our `animationEnded` is called, and we clean up.


## Custom Presented View Controller Transition
With a presented view controller transition, you can customize not only the animation but also the final position of the presented view. Moreover, you can introduce ancillary views which remain in the scene while the presented view is presented, and are not removed until after dismissal is complete; for example, if the presented view is smaller than the presenting view and covers it only partially, you might add a dim‐ ming view between them, to darken the presenting view.

There is no existing view to serve as the container view; therefore, when the presenta‐ tion starts, the runtime constructs the container view and inserts it into the interface, leaving it there for only as long as the view remains presented. In the case of a .full- Screen presentation, the runtime also rips the presenting view out of the interface and inserts it into the container view, because you might want the presenting view to participate in the animation. For other styles of presentation, the container view is in front of the presenting view, which can’t be animated and is left in place as the presen‐ tation proceeds.
