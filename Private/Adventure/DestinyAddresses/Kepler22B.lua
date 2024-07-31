address = {"G3", "G30", "G9", "G21", "G11", "G4", "G17"}

c = require("component")
event = require("event")
os = require("os")
sg = c.stargate

print("Dialing")
for i,v in ipairs(address) do print(i,v) end
print()

loop = true

function dialNext(dialed)
	glyph = address[dialed + 1]
	print("Engaging "..glyph.."... ")

	sg.engageSymbol(glyph)
end

function cancelEvents()
	event.cancel(eventEngaged)
	event.cancel(openEvent)
	event.cancel(failEvent)
	
	print("Cancelled all event listeners")
	
	loop = false
end

eventEngaged = event.listen("stargate_spin_chevron_engaged", function(evname, address, caller, num, lock, glyph)	
	os.sleep(0.5)
		
	if lock then		
		print("Engaging...")
		sg.engageGate()
	else
		dialNext(num)
	end
end)

dialNext(0)

openEvent = event.listen("stargate_open", function()
	print("Stargate opened successfully")
	cancelEvents()

    os.sleep(120)

    print("Closing the Gate")
    sg.disengageGate()

    dofile("steamrelease.lua")

end)

failEvent = event.listen("stargate_failed", function()
	print("Stargate failed to open")
	cancelEvents()
end)

while loop do os.sleep(0.1) end