#import "SnapshotHelper.js"


var target = UIATarget.localTarget();
var app = target.frontMostApp();
var window = app.mainWindow();

var path = "./screenshots.json"
var result = target.host().performTaskWithPathArgumentsTimeout("/bin/cat" , [path], 5);
var config = result.stdout

UIALogger.logStart("Logging element "  + config)

var json = JSON.parse(config)

UIALogger.logStart("Logging element "  + json)

target.delay(5)
captureLocalizedScreenshot("01MainMenu")

window.tableViews()[0].cells()["sidebar" + json["sidebarListItemIndex"]].tap();
target.delay(1);
captureLocalizedScreenshot("02List")
                                           
window.tableViews()[1].cells()["list" + json["listDetailViewIndex"]].tap()
target.delay(1);
captureLocalizedScreenshot("03ListDetails")

target.frontMostApp().navigationBar().leftButton().tap();
target.delay(0.5);
target.frontMostApp().navigationBar().leftButton().tap();
