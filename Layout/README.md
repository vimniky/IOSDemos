#  Layout

We have seen that a subview moves when its superview’s bounds origin is changed. But what happens to a subview when its superview’s bounds (or frame) size is changed?

Of its own accord, nothing happens. The subview’s bounds and center haven’t changed, and the superview’s bounds origin hasn’t moved, so the subview stays in the same position relative to the top left of its superview. In real life, however, that often won’t be what you want. You’ll want subviews to be resized and repositioned when their superview’s bounds size is changed. This is called layout.

Layout is performed in three primary ways:

1. **Manual layout**: The superview is sent the layoutSubviews message whenever it is resized; so, to lay out subviews manually, provide your own subclass and override layout- Subviews. Clearly this could turn out to be a lot of work, but it means you can do anything you like.

2. **Autoresizing**:  Autoresizing is the oldest way of performing layout automatically. When its superview is resized, a subview will respond in accordance with the rules prescribed by its own autoresizingMask property value, which describes the resizing relationship between the subview and its superview.

3. **Autolayout**: Autolayout depends on the constraints of views. A constraint (an instance of NSLayoutConstraint) is a full-fledged object with numeric values describing some aspect of the size or position of a view, often in terms of some other view; it is much more sophisticated, descriptive, and powerful than the autoresizing- Mask. Multiple constraints can apply to an individual view, and they can describe a relationship between any two views (not just a subview and its superview). Autolayout is implemented behind the scenes in layoutSubviews; in effect, constraints allow you to write sophisticated layoutSubviews functionality without code. 

**Which one to use**: Your layout strategy can involve any combination of those. The need for manual layout is rare, but it’s there if you need it; autoresizing is the default, in a sense, with autolayout acting as an opt-in alternative, and a view that uses autolayout can live side by side with a view that uses autoresizing. In real life, however, it is quite likely that all your views will opt in to autolayout, because it’s so powerful and best suited to help your interface adapt to a great range of screen sizes.

