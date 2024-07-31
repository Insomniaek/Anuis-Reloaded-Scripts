c = require("component")
event = require("event")
os = require("os")
sg = c.stargate

print("Changing Iris State")
sg.toggleIris()

os.sleep(0.5)
