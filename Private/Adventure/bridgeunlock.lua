local os = require("os")
local sides = require("sides")

rs = component.proxy(component.get(""))
password = ""

print("Please enter the Password to unlock the Bridge: ")
inputPw = io.read()

if inputPw == password then
  rs.setOutput(sides.left, 5)
  rs.setOutput(sides.right, 5)
  print("Opening Bridge Door for 3 Minutes")
  os.sleep(180)
  rs.setOutput(sides.left, 0)
  rs.setOutput(sides.right, 0)
  print("Closing the Door")
else
  print("Wrong Password")
end

os.sleep(0.5)
