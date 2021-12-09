#!/usr/bin/env python3
import sys, random

class RandomExplore:
    def __init__(self):
        self.x = 0.0
        self.th = 0.0
        
    def explore(self):
        print("EXPLORING")
        self.x = 1.0
        self.th = self.randOrientation() + self.zNoise()
        return self.x, self.th
    
    def randOrientation(self):
        orientation = random.gauss(0.0, 0.5)
        return orientation

    def zNoise(self):
        z_noise = random.gauss(0.0, 0.3)
        return z_noise

