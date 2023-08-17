local status, operators = pcall(require, "mini.operators")
if not status then
	print("mini.operators error")
	return
end

operators.setup()

-- evaluate g=
-- exchange gx
-- multiply gm
-- replace  gr
-- sort     gs
