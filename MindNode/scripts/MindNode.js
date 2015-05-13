#import "SnapshotHelper.js"

var target = UIATarget.localTarget();
var app = target.frontMostApp();
var window = app.mainWindow();


target.delay(1);

if (window.collectionViews().length == 0) {
    // first app start
    window.buttons()[0].tap();
}

if (window.collectionViews().length == 0) {
  app.navigationBar().leftButton().tap(); // go out of the default document
}

target.setDeviceOrientation(UIA_DEVICE_ORIENTATION_PORTRAIT);
target.delay(3) // UI Automation Bug
target.setDeviceOrientation(UIA_DEVICE_ORIENTATION_LANDSCAPERIGHT);

target.delay(3)

// Select the document
// The space after the name is required!
window.collectionViews()[0].cells()["What is Mind Mapping? "].scrollToVisible()
window.collectionViews()[0].cells()["What is Mind Mapping? "].tap();
target.delay(3) // animation

// Select the light bulb, and open the style screen
window.scrollViews()[0].staticTexts()["What is\nMind Mapping?"].tapWithOptions({tapOffset:{x:0.55, y:0.39}}); // click on light bulb
app.navigationBar().rightButton().tap(); // open the styling screen

// switch to style
target.delay(3) // This is super important because of the slide animation
try {
  if (isTablet()) {
    window.elements()["Canvas"].segmentedControls()[0].buttons()["Style"].tap(); 
  } else {
    app.navigationBar().segmentedControls()[0].buttons()["Style"].tap();
  }
}
catch(err) { /* we don't care about this, as it gets randomly raised depending on if it was already active */ }

captureLocalizedScreenshot("01Brainstorming")

// Switch to Organisation
if (!isTablet()) {
  app.navigationBar().buttons()[1].tap(); // iPhone only: hide the sheet
}

// More code here
