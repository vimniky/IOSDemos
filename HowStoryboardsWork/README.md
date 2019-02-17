#  How Storyboards work


 A storyboard typically uses the third approach to supply a view controller with its view: the view is loaded from a nib. But the storyboard conceals the nib so that you don’t see it as a separate file. In fact, the nib isn’t even created until you build the app. At that moment, the storyboard is compiled into a .storyboardc bundle, and each scene in the storyboard, representing a view controller and its view, is split into two nibs:
 
 1.  View controller nib:
 
        - The first nib contains just the view controller.

2.  View nib

    - The second nib contains the view, its subviews, and any other top-level objects such as gesture recognizers. The view nib has a special name, such as 01J-lp- oVM-view-Ze5-6b-2t3.nib. It is correctly configured: its File’s Owner class is the view controller’s class, with its view outlet hooked to the view.

As a result of this architecture, a storyboard has all the memory management advantages of nib files: none of these nib files are loaded until the instances that they contain are needed, and they can be loaded multiple times to give additional instances of the same nib objects. At the same time, you get the convenience of being able to see and edit a lot of your app’s interface simultaneously in one place.
