## [0.4.1] - 7/15/2021
* Updated mechanism for handling themes.
* Added HoverPage properties for disabling global widgets per page.

## [0.4.0] - 7/15/2021
* Revamp of library structure.

## [0.3.2] - 6/30/2021
* Made enhancements for web and improved features on mobile responsive widgets.
## [0.3.1] - 6/29/2021
* Updated widget default values for consistency.
## [0.3.0] - 6/26/2021
* Updated for null safety.

## [0.2.3] - 6/7/2021
* Added the onSubmmitted property to the HoverSearchBar to enable submission of the user's search query when the enter key is pressed.

## [0.2.2] - 6/6/2021
* Added logic for determining type of key event for the CustomForm's RawKeyboardListener.

## [0.2.1] - 6/6/2021
* Wrapped CustomForm in RawKeyboardListener to enable form submission using the Enter key.
* Fixed HoverLoginForm default title text typo.

## [0.2.0] - 6/2/2021
* Updated property names of some widgets.
* Updated implementation of Form widgets.
* Updated button widgets that were using deprecated widgets.

## [0.1.13] - 1/12/2021
* Created the HoverViewSplitter widget.
* Added tabletColumnsPerRow to HoverResponsiveGrid.
* Added properties to HoverSearchBar for customization.

## [0.1.12] - 1/12/2021
* Created the HoverResponsiveGrid widget to provide a mobile responsive grid layout.
* Updated the snackbar helper functions to use ScaffoldMessenger.

## [0.1.11] - 12/3/2020
* HoverSharedPreferencesHelper: changed saveSetting to return Future<bool>

## [0.1.10] - 10/25/2020
* Renamed HoverImageSlider to HoverSlider and updated the widget's layout structure.
* Added documentation for widgets.

## [0.1.9] - 10/21/2020
* Created HoverBasicField class to provide a customizable field for forms.
* Added HoverFluentValidator and HoverValidationRule for use with form validation.
* Added margin and padding properties to HoverBaseCard for customization.

## [0.1.8] - 10/4/2020
* Updated names to some widgets missing the 'Hover' prefix.
* Created the HoverSnackBar and updated the helper functions for displaying snackbars
* Created the HoverBaseCard widget.

## [0.1.7] - 10/2/2020
* Hover.create now requires List<`HoverPage`> instead of List<`HoverRoute`>
* Removed the HoverSwapper widget from the library.
* Removed the HoverSwapper sample page from the example app.
* Added form widgets.
* Created a sample page for the EmailSignInForm widget.

## [0.1.6] - 5/2/2020
* Created static helper methods for getting the screen height/width.

## [0.1.5] - 4/30/2020
* Updated the routing functions.
* Moved widget classes to a separate library.

## [0.1.4] - 4/29/2020
* Updated the SnackBar functions.
* Added regenerate method for routing.

## [0.1.3] - 4/28/2020
* Updated the routing and drawer toggle functions.
* Removed the use of Global keys for scaffolds.

## [0.1.2] - 4/27/2020
* Updated the routing functions.
* Fixed null theme issue encountered when loading the app theme on startup.

## [0.1.1] - 4/25/2020
* Updated the HoverSwapper.
* Updated the theme save/set functions. Theme data is saved via shared preferences.
* Added functions for saving/loading string data via shared preferences.

## [0.1.0] - 4/3/2020
* Implemented theme switching and updated the example.