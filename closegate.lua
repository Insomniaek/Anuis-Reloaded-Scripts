c = require("component")
event = require("event")
os = require("os")
sg = c.stargate

print("Closing the Gate")
sg.disengageGate()

os.sleep(0.5)
