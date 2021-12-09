# How to install the allostasis_ws repository.

1. Create a folder named 'allostasis_ws' and clone this repository into that folder
2. Source the workspace by entering the command 'source devel/setup.bash'
3. Build the workspace by entering the command 'catkin_make -DPYTHON_EXECUTABLE=/usr/bin/python3'
4. Open the gazebo simulation: 'roslaunch gazebo_simulation roseco_env.launch'
5. Activate spawner of random resources: 'rosrun gazebo_simulation ResourceSpawner.py'. 
You will need first to edit the spawn_cmd in ResourceSpawner.py to define the path to the models in your machine.
6. Activate the controllers: 'roslaunch allostatic_control allostatic_control.launch'. 
You will need first to edit the path to behavior repository folder in ActionSelector.py. 
