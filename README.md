ShakeEnvironment
=================

A way to quickly change the environment or scheme of your xcode project just with shake your device. [Support](mailto:http://agus.c@icloud.com)

demo : https://www.youtube.com/watch?v=zrcPlwJMiOY

Screenshoot:

![simulator screen shot apr 10 2017 2 00 10 pm](https://cloud.githubusercontent.com/assets/1490342/24849534/77638c5a-1df6-11e7-89f5-ff76c19b15b1.png)
![simulator screen shot apr 10 2017 2 00 20 pm](https://cloud.githubusercontent.com/assets/1490342/24849536/77b49352-1df6-11e7-9650-f2b0f7eabd75.png)


Code:

``` swift
  extend your viewController to `ShakeEnvironmentController`
```
``` swift
  implements `ConfigDelegate`
  
  let configs = Config.sharedInstance
  configs.delegate = self
  
  func envShanged(_ env: String) {
		print("ENV \(env)")
  }
  
 ```
 
 

Pod:

```
   will be avalaible soon
```
