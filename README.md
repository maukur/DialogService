# DialogService

A Dialog Service for easy way using from buisness logic layer for UIKit and SwiftUI

# Setup with Swift PM

1. Add ‘DialogService’ to your Project’s ‘Swift Packages’ section.
2. Input desired version.
3. Adding package dependencies to your App.



# Usage 

## Initialization 

```
@main
struct thisorthatApp: App {
  init() {
    DialogService.initialize(getTopViewController: getTopViewController)
  }
  
  func getTopViewController() -> UIViewController? {
    return UIApplication.shared.windows.first?.rootViewController;
  }
} 
```

## Using 

```
class PurchaseViewModel: DialogProtocol {
  func shopError() {
    showAlert(title: "Error", message: "Do you want continiue", action: "Yes", cancelAnction: "No") { result in
      if result {
         foo()
      }
      else {
         bar()
      }
    }
  }
}
```



# Sample 

![alt text](https://github.com/maukur/DialogService/blob/master/Resources/Alert.png "Alert")
![alt text](https://github.com/maukur/DialogService/blob/master/Resources/ActionSheet.png "Action Sheet")


