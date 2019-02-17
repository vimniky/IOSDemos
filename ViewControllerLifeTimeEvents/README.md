#  View Controller Lifetime Events

As views come and go, driven by view controllers and the actions of the user, events arrive that give your view controller the opportunity to respond to the various stages of its own existence and the management of its view. By overriding these methods, your UIViewController subclass can perform appropriate tasks at appropriate moments.


1. The view controller has obtained its view 
    - viewDidLoad

2. The view controller’s view is being resized or the trait environment is changing, or both:
    - willTransition(to:with:)
    - viewWillTransition(to:with:)
    - traitCollectionDidChange(_:)
    
3. The view is receiving updateConstraints and layoutSubviews events:
    - updateViewConstraints
    - viewWillLayoutSubviews
    - viewDidLayoutSubviews

4. The view controller is being added or removed as a child of another view controller:
    - willMove(toParent:)
    - didMove(toParent:)
    
5.  The view is being added to or removed from the interface. 
    - viewWillAppear(_:)
    - viewDidAppear(_:)
    - viewWillDisappear(_:)
    - viewDidDisappear(_:)

    This includes being supplanted by another view controller’s view or being restored through the removal of another view controller’s view. A view that has appeared is in the window; it is part of your app’s active view hierarchy. A view that has disappeared is not in the window; its window is nil:To distinguish more precisely why your view is appearing or disappearing, consult any of these properties of the view controller:
    
        - isBeingPresented
        - isBeingDismissed
        - isMovingtoParent
        - isMovingFromParent

**Order of Events**

When UIViewController being pushed onto the stack of a navigation controller. It receives, in this order, the following messages:

1. willMove(toParent:)
2. viewWillAppear(_:)
3. updateViewConstraints
4. traitCollectionDidChange(_:)
5. viewWillLayoutSubviews
6. viewDidLayoutSubviews
7. viewDidAppear(_:)
8. didMove(toParent:)

When this same UIViewController is popped off the stack of the navigation control‐ ler, it receives, in this order, the following messages:

1. willMove(toParent:) (with parameter nil) 
2. viewWillDisappear(_:)
3. viewDidDisappear(_:)
4. didMove(toParent:) (with parameter nil)

When another view controller is pushed on top of it, the first view controller gets these messages:

1. viewWillDisappear(_:)
2. viewDidDisappear(_:)

The converse is also true. For example, when a view controller is popped from a navigation controller, the view controller that was below it in the stack (the back view controller) receives these messages:

1. viewWillDisappear(_:)
2. viewDidDisappear(_:)

A view does not disappear if a presented view controller’s view merely covers it rather than supplanting it. For example, a view controller that presents another view con‐ troller using the .formSheet presentation style gets no lifetime events during presen‐ tation and dismissal.

A view does not disappear merely because the app is backgrounded and suspended. Once suspended, your app might be killed. So you cannot rely on viewWillDisappear(_:) or viewDidDisappear(_:) alone for saving data that the app will need the next time it launches. If you are to cover every case, you may need to ensure that your data-saving code also runs in response to an application lifetime event such as applicationWillResignActive or applicationDidEnterBackground.

Sometimes viewWillAppear(_:) arrives without a corresponding viewDidAppear(_:); similarly, sometimes viewWillDisappear(_:) arrives without a corresponding viewDidDisappear(_:). A case in point is when an interactive transition animation begins and is cancelled.


## Event Forwarding to a Child View Controller

A custom container view controller must effectively send willMove(toParent:) and didMove(toParent:) to its children manually, and it will if you do the dance correctly when your view controller acquires or loses a child view controller.

A custom container view controller must forward resizing events to its children. This will happen automatically if you call super in your implementation of the willTransition methods.
