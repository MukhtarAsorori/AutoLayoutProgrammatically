# Understanding Auto Layout
Auto Layout dynamically calculates the size and position of all the views in your view hierarchy, based on constraints placed on those views. For example, you can constrain a button so that it is horizontally centered with an Image view and so that the button’s top edge always remains 8 points below the image’s bottom. If the image view’s size or position changes, the button’s position automatically adjusts to match.

This constraint-based approach to design allows you to build user interfaces that dynamically respond to both internal and external changes.

# External Changes
External changes occur when the size or shape of your superview changes. With each change, you must update the layout of your view hierarchy to best use the available space. Here are some common sources of external change:

The user resizes the window (OS X).

The user enters or leaves Split View on an iPad (iOS).

The device rotates (iOS).

The active call and audio recording bars appear or disappear (iOS).

You want to support different size classes.

You want to support different screen sizes.

Most of these changes can occur at runtime, and they require a dynamic response from your app. Others, like support for different screen sizes, represent the app adapting to different environments. Even through the screen size won’t typically change at runtime, creating an adaptive interface lets your app run equally well on an iPhone 4S, an iPhone 6 Plus, or even an iPad. Auto Layout is also a key component for supporting Slide Over and Split Views on the iPad.

# Internal Changes
Internal changes occur when the size of the views or controls in your user interface change.

Here are some common sources of internal change:

The content displayed by the app changes.

The app supports internationalization.

The app supports Dynamic Type (iOS).

When your app’s content changes, the new content may require a different layout than the old. This commonly occurs in apps that display text or images. For example, a news app needs to adjust its layout based on the size of the individual news articles. Similarly, a photo collage must handle a wide range of image sizes and aspect ratios.
