# stack_navigation

This packages allows navigation with a history foreach item in the bottomnavigation bar. 

## Use case

I want to have a simple Navigation like the one used in Instagram. Meaning as a user I have a stack of Widgets for each Navigation Item. Lets say I have a Navigationbar with 3 items (A,B,C).
The following picture depicts the stacks on an arbitrary state:
![1](https://user-images.githubusercontent.com/15171332/113896552-5595ca00-97ca-11eb-9ce2-a0e9cab927eb.png)
Currently the B Item is selected in the Navbar. Therefore, the current visible Widget is xb3!
If I click the Navbar Item A now, the current Widget changes to x2a as shown in the following picture:
![2](https://user-images.githubusercontent.com/15171332/113896830-942b8480-97ca-11eb-8dbb-d15c5bd61a8c.png)
I can add another Widget on top of the current stack by a "simple push":
![3](https://user-images.githubusercontent.com/15171332/113896923-ad343580-97ca-11eb-805b-a04f679d5528.png)
As you can see, the visible widget is now xa3 and xa3 got pushed on the A stack.
If I am in the A stack and click the navbar item A again, then the current stack gets popped until A appears, leading to this configuration:
![4](https://user-images.githubusercontent.com/15171332/113897190-eff60d80-97ca-11eb-92d8-a1be46261593.png)

