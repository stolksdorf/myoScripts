scriptId = 'com.stolksdorf.2048'
schemeId = 'com.stolksdorf.2048'

-- Makes use of myo.getArm() to swap wave out and wave in when the armband is being worn on
-- the left arm. This allows us to treat wave out as wave right and wave in as wave
-- left for consistent direction. The function has no effect on other poses.
function conditionallySwapWave(pose)
	if myo.getArm() == "left" then
		if pose == "waveIn" then
			pose = "waveOut"
		elseif pose == "waveOut" then
			pose = "waveIn"
		end
	end
	return pose
end

function onPoseEdge(pose, edge)
	if edge == 'off'  then
		return true
	end

	pose = conditionallySwapWave(pose)

	if pose == "waveIn" then
		myo.keyboard("left_arrow", "press")
	elseif pose == "waveOut" then
		myo.keyboard("right_arrow", "press")
	elseif pose == "fist" or pose == "thumbToPinky" then
		myo.keyboard("down_arrow", "press")
	elseif pose == "fingersSpread" then
		myo.keyboard("up_arrow", "press")
	end
end

function onForegroundWindowChange(app, title)
	if string.find(title, 2048) and string.find(title, 'Sublime') == nil then
		return true
	end
	return false
end

