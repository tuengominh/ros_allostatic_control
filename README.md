1. Source the workspace: 'source devel/setup.bash'
2. Build the workspace: 'catkin_make -DPYTHON_EXECUTABLE=/usr/bin/python3'
4. Open Gazebo simulation: 'roslaunch gazebo_simulation roseco_env.launch'
5. Activate spawner of random resources: 'rosrun gazebo_simulation ResourceSpawner.py'. 
Edit the 'spawn_cmd' in *ResourceSpawner.py* to define the path to the models.
6. Activate the controllers: 'roslaunch allostatic_control allostatic_control.launch'. 
Edit the path to behavior repository folder in *ActionSelector.py*. 
