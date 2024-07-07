# Swift Task
A task submiited to careers@savannahtech.io, by Ayokunle Emmanuel Fatokimi 


# Task
- In installation of the app, press the button in the middle bottom of the screen then click any where on the screen to reveal a measurement interface with a blue rectangle and magnifying glass.
Your task is to improve the look and feel of the measurement screen.


# Solution
- Fixes and Improvement made
- Modification made

## Fixes and Improvement made:
1. Catch and capture possible crash in the SceneRecontructionViewController: I ensured the device supports required ARKit features. (.meshWithClassification, .sceneDepth and .smoothedSceneDepth)
2. I deleted the existing DrawRulersViewController
3. I created a Version 2 of DrawRulers, DrawRulersViewControllerV2
4. To avoid crash while drawing: I ensured re-rendering of the new node(drawing) does not block the current thread, and get dispatched to the main thread afterwards.
5. I adjusted the offset point to the magnifying glass usage, to be more precise.
6. I made improvements to the color and font choice for both valid-depth drawings and invalid-depth.
7. Delete the TableViewController class, since its implementation was redundant.
8. Compartmentalize each Controller to it file/folder

## Modification made:
1. modified the project's bundle identifier to allow it to be a tenant on my Apple account, (com.adwith.PlaneMeasurement.ayokunle)
2. Deleted the Magnifying-glass framework, and cleared the Package.resolved file.
3. Re-added the Magnifying-glass framework.



# Others:
- Dependencies
- Build and Run Instruction

## Dependencies
- MagnifyingGlass-Swift: Easily create and customize magnifying glass effec

## Build and Run Instruction
- Download and Extract the zip file.
- Open the file named: "PlaneMeasurement.xcodeproj"  (Ensure you have Xcode installed)
- Build the project with (Cmd + B) (Ensure you have Internet Connection)
- Plug in your iPhone to the MacBook, (must be at least iPhone 12 pro and above)
- Run the project with (Cmd + R)
- The App then will run and open in the selected iPhone-simulator 
