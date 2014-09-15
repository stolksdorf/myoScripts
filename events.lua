scriptId = 'com.stolksdorf.events'
schemeId = 'com.stolksdorf.events'

myo._events = {}

myo.trigger = function(eventName, ...)
	args = {...}
	for i, event in ipairs(myo._events) do
		if event['name'] == eventName then
			event['func'](unpack(args))
		end
	end
end
myo.on = function(name, fn)
	table.insert(myo._events, {name = name, func = fn})
end


--[[Tests
myo.on('test', function(a, b) myo.debug(tostring(b)) end)
myo.on('test', function(a, b) myo.debug(tostring(a)) end)
myo.on('test2', function(a, b) myo.debug('WOAH') end)

myo.trigger('test2', 'cool', 'so cool')
]]







