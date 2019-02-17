#  Scroll View

A scroll view (UIScrollView) is a view whose content is larger than its bounds. To reveal a desired area, the user can scroll the content by dragging, or you can reposi‐ tion the content in code.

A scroll view isn’t magic; it takes advantage of ordinary UIView features. The content is simply the scroll view’s subviews. When the scroll view scrolls, what’s really changing is the scroll view’s own bounds origin; the subviews are positioned with respect to the bounds origin, so they move with it. The scroll view’s clipsTo- Bounds is true, so any content positioned within the scroll view is visible and any content positioned outside it is not. A scroll view thus functions as a limited window on a larger world of content.

A scroll view has the following specialized abilities:

- It knows how to shift its bounds origin in response to the user’s gestures
- It provides scroll indicators whose size and position give the user a clue as to the content’s size and position.
- It can enforce paging, whereby the user can scroll only by a fixed amount.
-  It supports zooming, so that the user can resize the content with a pinch gesture.
- It provides delegate methods so that your code knows exactly how the user is scrolling and zooming.
