scriptId = 'com.stolksdorf.armBusy'
schemeId = 'com.stolksdorf.armBusy'

-- Events
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


-- Arm Busy
myo.armIsBusy = false
myo.armBusyData = 0

ema_alpha = 0.1
armBusyThreshold = 80
function armBusyPeriodic()
	ema = myo.armBusyData + ema_alpha * (math.abs(myo.getGyro.X()) + math.abs(myo.getGyro.Y()) + math.abs(myo.getGyro.Z()) - myo.armBusyData);


	if ema > armBusyThreshold then

	end

	myo.debug(tostring(ema))

end


function onPoseEdge(pose, edge)
    myo.debug("onPoseEdge: " .. pose .. ", " .. edge)
end





function onPeriodic()
	--armBusyPeriodic()

	myo.debug('test')




end