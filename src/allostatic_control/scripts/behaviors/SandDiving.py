#!/usr/bin/env python3
import sys, random

class SandDiving:
    def __init__(self):
        self.x = 0
        self.th = 0

    def dive(self, drive, adsign, hsign):
        self.x = 1.0 * (1 + drive * 10)
        self.th = -1.0 * hsign * adsign
        return self.x, self.th
