#!/usr/bin/env python3
import sys, random

class CatchTarget:
    def __init__(self, Target_x):
        self.x = 0.0
        self.th = 0.0
        self.Target_x = Target_x

    def catch(self, drive):
        if self.Target_x != 0:
            if self.Target_x > 320:
                self.x = 1.0 * (1 + drive * 10)
                self.th = -0.1
            else:
                self.x = 1.0 * (1 + drive * 10)
                self.th = 0.1
        return self.x, self.th