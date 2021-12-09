#!/usr/bin/env python3
import sys, random

class AvoidObstacle:
    def __init__(self):
        self.x = 0.0
        self.th = 0.0
        
    def avoid(self, R_obstacle_dist, L_obstacle_dist, R_obstacle, L_obstacle):
        obs_dist_th = 0.4

        self.R_obstacle_dist = R_obstacle_dist
        self.L_obstacle_dist = L_obstacle_dist
        self.R_obstacle = R_obstacle
        self.L_obstacle = L_obstacle

        # Near obstacle - Hard turning
        if self.R_obstacle_dist < (obs_dist_th/2) or self.L_obstacle_dist < (obs_dist_th/2):
            print("AVOIDING NEAR")
            if self.R_obstacle_dist < obs_dist_th/2:
                self.x = 0.0
                self.th = 1.0
            elif self.L_obstacle_dist < obs_dist_th/2:
                self.x = 0.0
                self.th = -1.0

        # Far obstacle - Soft turning
        elif self.R_obstacle == True or self.L_obstacle == True:
            print("AVOIDING FAR")
            if self.R_obstacle_dist > self.L_obstacle_dist:
                self.x = 1.0
                self.th = -1.0 - (abs(self.zNoise()))
            elif self.L_obstacle_dist > self.R_obstacle_dist:
                self.x = 1.0
                self.th = 1.0 + (abs(self.zNoise()))

        return self.x, self.th

    def randOrientation(self):
        orientation = random.gauss(0, 0.3)
        return orientation
    
    def zNoise(self):
        z_noise = random.gauss(0, 0.1)
        return z_noise

