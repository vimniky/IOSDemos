#  View Controller presentation

## View controller relationships during presentation

The presenting view controller (the presented view controller’s presentingViewController) is not necessarily the same view controller to which you sent present(_:animated:completion:). It will help if we distinguish three roles that view controllers can play in presenting a view controller:

1. **Presented view controller**: The first argument to present(_:animated:completion:).
2. **Original presenter**: The view controller to which present(_:animated:completion:) was sent. Apple sometimes refers to this view controller as the source. The presented view controller is set as the original presenter’s presentedView- Controller.
3. **Presenting view controller**:  The view controller whose view is replaced or covered by the presented view controller’s view. By default, it is the view controller that was the top-level view controller prior to the presentation. It might not be the same as the original presenter. This view controller is set as the presented view controller’s presentingViewController. The presented view controller is set as the presenting view controller’s presentedViewController. (Thus, the presented view controller might be the presentedViewController of two different view controllers.)

You can test whether a view controller’s presentedViewController or presentingViewController is nil to learn whether presentation is occurring. For example, a view controller whose presentingViewController is nil is not a presented view controller at this moment.

- A view controller can have at most one presentedViewController. If you send present(_:animated:completion:) to a view controller whose presentedViewController isn’t nil, nothing will happen and the completion function is not called (and you’ll get a warning from the runtime). However, a presented view controller can itself present a view controller, so there can be a chain of presented view controllers.

The receiver of dismiss(animated:completion:) may be any of those three objects; the runtime will use the linkages between them to transmit the necessary messages up the chain on your behalf to the presentingViewController.

1. If you send dismiss(animated:completion:) to a view controller whose presentedViewController is nil and that has no presentingViewController, nothing will happen (not even a warning in the console), and the completion function is not called.

2. If you send dismiss(animated:completion:) to a view controller whose presentedViewController is nil and that has a presentingViewController, it will dissmiss it self.

3. If you send dismiss(animated:completion:) to a view controller in the middle of a presentation chain — a view controller that has both a presentingViewController and a presentedViewController — then its presentedViewController is dismissed.




 
 ## Transition style
 
 **Transition style**:
 
 When a view controller is presented and later when it is dismissed, a simple anima‐ tion of its view can be performed, according to whether the animated: parameter of the corresponding method is true. There are a few different built-in animation types (modal transition styles) to choose from.
 
 To choose a built-in animation, set the presented view controller’s `modalTransitionStyle` property prior to the presentation.
 
 - .coverVertical (the default)
 - .flipHorizontal
 - .crossDissolve
 - .partialCurl
 

**Presentation style**:

By default, the presented view controller’s view occupies the entire screen, completely replacing that of the presenting view controller. But you can choose from some other built-in options expressing how the presented view controller’s view should cover the screen (modal presentation styles).

To choose a presentation style, set the presented view controller’s `modalPresentationStyle` property prior to the presentation. 

- .fullScreen
    - The default. The presenting view controller is the top-level view controller, and its view — meaning the entire interface — is replaced.
- .overFullScreen
    - Similar to .fullScreen, but the presenting view controller’s view is not replaced; instead, it stays where it is, possibly being visible during the transition, and remaining visible behind the presented view controller’s view if the latter has some transparency.
- .pageSheet
- .formSheet
- .currentContext
    - The presenting view controller can be any view controller, such as a child view controller. The presented view controller’s view replaces the presenting view con‐ troller’s view, which may have been occupying only a portion of the screen.
- .overCurrentContext
    - Like .currentContext, but the presented view controller’s view covers the pre‐ senting view controller’s view rather than replacing it. Again, this may mean that the presented view controller’s view now covers only a portion of the screen. .overCurrentContext will often be a better choice than .current- Context, because some subviews don’t behave well when automatically removed from their superview and restored later.
 
**Current context presentation**

When the presented view controller’s modalPresentationStyle is .currentContext or .overCurrentContext, a decision has to be made by the runtime as to what view controller should be the presenting view controller. This will determine what view will be replaced or covered by the presented view controller’s view. The decision involves another UIViewController property, `definesPresentationContext` (a Bool), and possibly still another UIViewController property, `providesPresentationContextTransitionStyle`. Here’s how the decision operates:

1.  Starting with the *original presenter* (the view controller to which present(_:animated:completion:) was sent), we walk up the chain of parent view controllers, looking for one whose `definesPresentationContext` property is true. If we find one, that’s the one; it will be the *presentingViewController*, and its view will be replaced or covered by the presented view controller’s view. (If we don’t find one, things work as if the presented view controller’s modal- PresentationStyle had been .fullScreen.)
2. If, during the search just described, we find a view controller whose `definesPresentationContext` property is true, we look to see if that view controller’s `providesPresentationContextTransitionStyle` property is also true. If so, that view controller’s `modalTransitionStyle` is used for this transition anima‐ tion, rather than the presented view controller’s `modalTransitionStyle`.
