require("autoclose").setup({
  options = {
    disable_when_touch = true,
    touch_regex = "[%w(%[{]" --(alphanumeric characters or ( or [ or {)'
  },
})
