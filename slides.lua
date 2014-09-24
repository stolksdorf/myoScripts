scriptId = 'com.stolksdorf.slides'
schemeId = 'com.stolksdorf.slides'

lastPose = ""
lastPoseTime = 0;
function onPoseEdge(pose, edge)
    myo.debug("onPoseEdge: " .. pose .. ", " .. edge)
    if edge then
		lastPose = pose
		lastPoseTime = myo.getTimeMilliseconds()
	else
		lastPose = ""
		lastPoseTime = 0
	end
end

function onForegroundWindowChange(app, title)
	if string.find(title, "Slides") then
		return true
	end
	return false
end

function onPeriodic()

	if lastPoseTime ~= 0 and (lastPoseTime + 200) < myo.getTimeMilliseconds() and lastPose ~= "rest" and not locked then
		lastPoseTime = 0
		myo.vibrate("short")

		if lastPose == 'waveOut' then
			myo.keyboard("right_arrow", "press")
		elseif lastPose == 'waveIn' then
			myo.keyboard("left_arrow", "press")
		elseif lastPose == 'fingersSpread' then
			myo.keyboard("up_arrow", "press")
		elseif lastPose == 'fist' then
			myo.keyboard("down_arrow", "press")
		end
	end

end