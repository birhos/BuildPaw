-- BuildPawNotifier: Stay-open app for notifications with custom icon.
-- See: https://stackoverflow.com/q/48856158

on notify(vTitle, vSubtitle, vBody, vSound)
	if vSound is not "" then
		display notification vBody with title vTitle subtitle vSubtitle sound name vSound
	else
		display notification vBody with title vTitle subtitle vSubtitle
	end if
end notify

on idle
	return 10
end idle
