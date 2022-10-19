local home = os.getenv("HOME")
local db = require("dashboard")

db.preview_command = "cat"
db.preview_file_path = home .. "/.config/nvim/assets/rimuru.ascii"
db.preview_file_height = 22
db.preview_file_width = 44
db.header_pad = 1
db.custom_center = {}
db.custom_footer = {}
