return {
  "olexsmir/gopher.nvim",
  ft = "go",
  branch = "develop",
  config = function ()
    require("gopher").setup({
      gotests = {
        template = "testify",
        named = true
      }
    })
  end
}
