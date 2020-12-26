# DialogService

A Dialog Service for easy way using from buisness logic layer for UIKit and SwiftUI


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

