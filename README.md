# Scroll controller bug

In this app you have two scroll views.

When you tap the FAB I want to get the size and offset (how far it's been scrolled) of the scroll views. 

The size of both I can get, but I can only get the offset for 1. 

When a scroll view is constructed in the vertical direction I can access the controller after it's been constructed. 

When a scroll view is constructed in the horizontal direction it has no controller attached 🤯