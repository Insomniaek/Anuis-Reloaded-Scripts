local os = require("os")
local sides = require("sides")

rs1 = component.proxy(component.get("c4e8b"))
rs2 = component.proxy(component.get("3b1ee"))

print("opening Steamhatches")
print("releasing Steam")

rs1.setOutput(sides.top, 15)
rs2.setOutput(sides.top, 15)

os.sleep(5)

print("closing Steamhatches")

rs1.setOutput(sides.top, 0)
rs2.setOutput(sides.top, 0)

print("Stargate is Operational again")

os.sleep(0.5)