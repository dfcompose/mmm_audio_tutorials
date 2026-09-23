
from mmm_audio import *

struct MyFirstGraph(Movable, Copyable):
    var synth: Osc[1]
    var freq: Float64
    var vol: Float64
    var messenger: Messenger
    
    def __init__(out self, world: World):
        self.synth = Osc[1](world)
        self.messenger = Messenger(world)
        self.freq = 440.0
        self.vol = 0.25
    
    def next(mut self) -> MFloat[2]:
        var out = MFloat[2](0.0)
        self.messenger.update("freq", self.freq)
        self.messenger.update("vol", self.vol)
        out += self.synth.next(self.freq)
        return out * self.vol

