#  How a View Controller gets its View

Initially, when it first comes into existence, a view controller has no view. A view con‐ troller is a small, lightweight object; a view is a relatively heavyweight object, involv‐ ing interface elements that can require a significant amount of memory. Therefore, a view controller postpones obtaining its view until it has to do so, namely, when it is asked for the value of its view property. At that moment, if its view property is nil, the view controller sets about obtaining its view. (We say that a view controller loads its view lazily.) Typically, this happens because the time has come to put the view con‐ troller’s view into the interface.

In working with a newly instantiated view controller, be careful not to refer to its view property if you don’t need to, since this can trigger the view controller’s obtain‐ ing its view prematurely. To learn whether a view controller has a view without causing it to load its view, consult its isViewLoaded property. You can also refer to a view controller’s view safely, without loading it, as its viewIfLoaded (an Optional).

As soon as a view controller has its view, its viewDidLoad method is called. If this view controller is an instance of your own UIViewController subclass, viewDidLoad is your opportunity to modify the contents of this view — to populate it with sub‐ views, to tweak the subviews it already has, and so forth — as well as to perform other initializations of the view controller and its properties. viewDidLoad is generally regarded as a valuable place to put initialization code, because it is one of the earliest events in the life of the view controller instance, and it is called only once in the instance’s lifetime.

When viewDidLoad is called, the view controller’s view property is pointing to the view, so it is safe to refer to self.view. Bear in mind, however, that the view may not yet be part of the interface! In fact, it almost certainly is not. (To confirm this, check whether self.view.window is nil.) Thus, for example, you cannot necessarily rely on the dimensions of the view at this point to be the dimensions that the view will assume when it becomes visible in the interface. Performing dimension-dependent customi‐ zations prematurely in viewDidLoad is a common beginner mistake.

Before viewDidLoad is called, the view controller must obtain its view. The question of where and how the view controller will get its view is often crucial. In some cases, to be sure, you won’t care about this; in particular, when a view controller is an instance of a built-in UIViewController subclass such as UINavigationController or UITabBarController, its view is out of your hands — you might never have cause to refer to this view over the entire course of your app’s lifetime — and you simply trust that the view controller will generate its view somehow. But when the view controller is an instance of your own subclass of UIViewController, and when you yourself will design or modify its view, it becomes essential to understand the process whereby a view controller gets its view.


The main alternatives are as follows:

1. The view may be instantiated in the view controller’s own code, manually.
1. The view may be created as an empty generic view, automatically.
1. The view may be loaded from a nib file (which could be a storyboard).

**Manual View**

To supply a UIViewController’s view manually, in code, override its loadView method. Your job here is to obtain an instance of UIView (or a subclass of UIView) — typically by instantiating it directly — and assign it to self.view. You must not call super.

When we created our view controller’s view (self.view), we never gave it a reason‐ able frame. This is because we are relying on someone else to frame the view appro‐ priately. In this case, the “someone else” is the window, which responds to having its rootViewController property set to a view controller by framing the view control‐ ler’s view appropriately as the root view before putting it into the window as a sub‐ view. In general, it is the responsibility of whoever puts a view controller’s view into the interface to give the view the correct frame — and this will never be the view con‐ troller itself.

## View in a Separate Nib

We can supplied and designed our view controller’s view in code. That works, but of course we’re missing out on the convenience of configuring and populating the view by designing it graphically in Xcode’s nib editor. So now let’s see how a view controller can obtain its view, ready-made, from a nib file.

To make this work, the nib file must be properly configured in accordance with the demands of the nib-loading mechanism. 

1. The *view controller instance* will already have been created.
1. In the nib, the owner object must have the same class as the view controller. This will also cause the *File’s Owner* to have a view outlet.
1. The view controller's *outlet* must point to the *view object* in the nib.
1. The veiw controller will load the nib, setting itself as the nib’s owner, and the veiw controller's view outlet is now populated with the *view object* loaded from nib.

The result is that when the view controller loads the nib, the view instantiated from the nib is assigned to the view controller’s view property automatically.

A UIViewController has a nibName property that tells it what nib, if any, it should load to obtain its view. However, we are not allowed to set the nibName property of  `vc` (it is read-only). Instead, as we instantiate the view controller, we use the designated initializer, `init(nib- Name:bundle:)`:

```swift
let vc = RootViewController(nibName:"MyNib", bundle:nil)
```

### Summay

 It turns out that the entire process is driven by `loadView`:
 
 1. When the view controller first decides that it needs its view, loadView is always called:

    -  If we override loadView, we supply and set the view in code, and we do not call super. Therefore, the process of seeking a view comes to an end.
    - If we don’t override loadView, UIViewController’s built-in default imple‐ mentation of loadView takes over, and performs the rest of the process.
2. UIViewController’s default implementation of loadView looks for a nib:
    - If the view controller was instantiated with an explicit `nibName`, a nib with that name is sought, and the process comes to an end. (If there is no such nib, the app will crash at launch.)
    - If the view controller was instantiated with a `nil` `nibName`, then:
        1. An eponymous nib is sought. If it is found, it is loaded and the process
    comes to an end.
        2. If the view controller’s name ends in “Controller,” an eponymous nib without the “Controller” is sought. If it is found, it is loaded and the process comes to an end.

3. If we reach this point, UIViewController’s default implementation of loadView creates a generic UIView. And the default loadview implementation is like the following

    ```swift
    view = UIView()
    ```

## How Storyboard Works
Storyboard conceals the nib so that you don’t see it as a separate file. In fact, the nib isn’t even created until you build the app. At that moment, the storyboard is compiled into a .storyboardc bundle, and each scene in the storyboard, representing a view controller and its view, is split into two nibs.

1. View controller nib
2. View nib

As a result of this architecture, a storyboard has all the memory management advan‐ tages of nib files: none of these nib files are loaded until the instances that they con‐ tain are needed, and they can be loaded multiple times to give additional instances of the same nib objects. At the same time, you get the convenience of being able to see and edit a lot of your app’s interface simultaneously in one place.
