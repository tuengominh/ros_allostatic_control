1. Source the workspace: 'source devel/setup.bash'
2. Build the workspace: 'catkin_make -DPYTHON_EXECUTABLE=/usr/bin/python3'
3. Edit the version of agent and the path to SF models in *ResourceSpawner.py*.
4. Edit the version of agent in *AllostaticController.py* and the path to behavior folder in *ActionSelector.py*.
5. Run Gazebo simulation: 'roslaunch gazebo_simulation roseco_env.launch'
6. Activate spawner of random resources: 'rosrun gazebo_simulation ResourceSpawner.py'. 
7. Activate homeostatic and allostatic controllers: 'roslaunch allostatic_control allostatic_control.launch'. 

