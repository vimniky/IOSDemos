#  Autolayout


NSLayoutConstraint properties are read-only, except for priority, constant, and isActive. If you want to change anything else about an existing constraint, you must remove the constraint and add a new one.

Once you are using explicit constraints to position and size a view, do not set its frame (or bounds and center); use constraints alone. Otherwise, when layoutSubviews is called, the view will jump back to where its constraints position it. However, you may set a view’s frame from within an implementation of layoutSubviews, and it is perfectly normal to do so.

**Implicit Autoresizing Constraints**

The mechanism whereby individual views can opt in to autolayout can suddenly involve other views in autolayout, even though those other views were not using autolayout previously. Therefore, there needs to be a way, when such a view becomes involved in autolayout, to generate constraints for it — constraints that will determine that view’s position and size identically to how its frame and autoresizingMask were determining them. The autolayout engine takes care of this for you: it reads the view’s frame and autoresizingMask settings and translates them into implicit con‐ straints (of class `NSAutoresizingMaskLayoutConstraint`). The autolayout engine treats a view in this special way only if it has its `translatesAutoresizingMaskIntoConstraints` property set to `true` — which happens to be the default.

Suppose a view has acquired automatically generated implicit constraints, and suppose you then proceed to attach further constraints to this view, explicitly setting its position or size. There will then almost certainly be a conflict between your explicit constraints and the implicit constraints. The solution is to set the view’s `translatesAutoresizingMaskIntoConstraints` property to false, so that the implicit constraints are not generated, and the view’s only constraints are your explicit constraints. In a nib with “Use Auto Layout” checked, there is no difficulty in this regard. The nib editor itself will switch a view’s `translatesAutoresizingMaskIntoConstraints` property to `false` as soon as you add constraints that would cause a problem. The trouble is most likely to arise when you create a view in code and then position or size that view with constraints, forgetting that you also need to set its `translatesAutoresizingMaskIntoConstraints` property to false. If that happens, you’ll get a conflict between constraints.


## Margins and Guides

Sometimes, however, you want a view to vend a set of secondary edges, with respect to which other views can be positioned. For example, you might want subviews to keep a minimum distance from the edge of their super‐ view, and the superview should be able to dictate what that minimum distance is. 

This notion of secondary edges is expressed in two different ways:

**Edge insets**

A view vends secondary edges as a UIEdgeInsets, a struct consisting of four floats representing inset values starting at the top and proceeding counterclockwise — top, left, bottom, right. This is useful when you need to interface with the secon‐ dary edges as numeric values — to set them, for example, or to perform manual layout.

**Layout guides**

The UILayoutGuide class represents secondary edges as a kind of pseudoview. It has a frame (its layoutFrame) with respect to the view that vends it, but its important properties are its anchors, which are the same as for a view. This, obvi‐ ously, is useful for autolayout.


### Safe area

An important set of secondary edges (starting in iOS 11) is the safe area. This is a feature of a UIView, but it is imposed by the UIViewController that manages this view. One reason the safe area is needed is that the top and bottom of the interface are often occupied by a bar (status bar, navigation bar, toolbar, tab bar. Your layout of subviews will typically occupy the region between these bars. But that’s not easy, because:

1.  A view controller’s main view will typically extend vertically to the edges of the window behind those bars.
2. The bars can come and go dynamically, and can change their heights. For exam‐ ple, by default, in an iPhone app, the status bar will be present when the app is in portrait orientation, but will vanish when the app is in landscape orientation; similarly, a navigation bar is taller when the app is in portrait orientation than when the app is in landscape orientation.

Therefore, you need something else, other than the literal top and bottom of a view controller’s main view, to which to anchor the vertical constraints that position its subviews — something that will move dynamically to reflect the current location of the bars. Otherwise, an interface that looks right under some circumstances will look wrong in others.

**UIViewController** imposes the safe area on its main view, describing the region of the main view that is overlapped by the status bar and other bars.

In real life, therefore, you’ll be particularly concerned to position subviews of a view controller’s main view with respect to the main view’s safe area. Your views con‐ strained to the main view’s safe area will avoid being overlapped by bars, and will move to track the edges of the main view’s visible area. To retrieve a view’s safe area as edge insets, fetch its safeAreaInsets. To retrieve a view’s safe area as a layout guide, fetch its safeAreaLayoutGuide.

A view controller can inset even further the safe area it imposes on its main view; set its additionalSafeAreaInsets. This, as the name implies, is added to the automatic safe area.


### Margins

A view also has margins of its own. Unlike the safe area, which propagates down the view hierarchy from the view controller, you are free to set an individual view’s margins. Once again, the idea is that a subview might be positioned with respect to its superview’s margins, especially through an autolayout constraint. **By default, a view has a margin of 8 on all four edges**. A view’s margins are available as a UILayoutGuide through the UIView `layoutMarginsGuide` property.

In visual format syntax, a view pinned to its superview’s edge using a single hyphen, with no explicit distance value, is interpreted as a constraint to the superview’s margin

The layoutMarginsGuide property is read-only. To allow you to set a view’s margins, a UIView has a layoutMargins property, a writable UIEdgeInsets. Starting in iOS 11, however, Apple would prefer that you set the directionalLayoutMargins property instead; this has the feature that when your interface is reversed in a right-to-left sys‐ tem language for which your app is localized, its leading and trailing values behave correctly (the left-to-right leading value becomes the right-to-left leading value). It is expressed as an NSDirectionalEdgeInsets struct, whose properties are top, leading, bottom, and trailing.

*Optionally, a view’s layout margins can propagate down to its subview*, in the following sense: a subview that overlaps its superview’s margin may acquire the amount of overlap as a minimum margin of its own. To switch on this option, set the subview’s `preservesSuperviewLayoutMargins` to true. For example, suppose we set the super‐ view’s `directionalLayoutMargins` to an `NSDirectionalEdgeInsets` with a leading value of 40. And suppose the subview is pinned 10 points from the superview’s leading edge, so that it overlaps the superview’s leading margin by 30 points. Then, if the subview’s `preservesSuperviewLayoutMargins` is true, the subview’s leading margin is 30.

*By default, a view’s margin values are treated as insets from the safe area*. For example, suppose a view’s top margin is 8. And suppose this view underlaps the entire status bar, and thus has acquired a safe area top of 20. Then its effective top margin value is 28 — meaning that a subview whose top is pinned exactly to this view’s top margin will appear 28 points below this view’s top. If you don’t like that behavior (perhaps because you have code that predates the existence of the safe area), you can switch it off by setting the view’s `insetsLayoutMarginsFromSafeArea` property to false; now a top margin value of 8 means an effective top margin value of 8.

## Custom layout guides

You can add your own custom UILayoutGuide objects to a view, for whatever pur‐ pose you like. They constitute a view’s layoutGuides array, and are managed by call‐ ing addLayoutGuide(_:) or removeLayoutGuide(_:). Each custom layout guide object must be configured entirely using constraints.

Why would you want to do that? Well, you can constrain a view to a UILayoutGuide, by means of its anchors. Thus, since a UILayoutGuide is configured by constraints, and since other views can be constrained to it, it can participate in layout exactly as if it were a subview — but it is not a subview, and therefore it avoids all the overhead and complexity that a UIView would have.

For example, consider the question of how to distribute views equally within their superview. This is easy to arrange initially, but it is not obvious how to design evenly spaced views that will remain evenly spaced when their superview is resized. The problem is that constraints describe relationships between views, not between constraints; there is no way to constrain the spacing constraints between views to remain equal to one another automatically as the superview is resized.

You can, on the other hand, constrain the heights or widths of views to remain equal to one another. The traditional solution, therefore, is to resort to spacer views with their isHidden set to true. But spacer views are views; hidden or not, they add over‐ head with respect to drawing, memory, touch detection, and more. Custom UILayoutGuides solve the problem; they can serve the same purpose as spacer views, but they are not views.
