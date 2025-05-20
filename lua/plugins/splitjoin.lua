return {
  {
    "Wansmer/treesj",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    keys = {
      {
        "<leader>m",
        function()
          require("treesj").toggle()
        end,
        desc = "Split/join code block",
      },
    },
    opts = function()
      local langs = require("treesj.langs")
      local lang_utils = require("treesj.langs.utils")

      langs.presets.ruby = lang_utils.merge_preset(langs.presets.ruby, {
        body_statement = lang_utils.set_preset_for_non_bracket({
          both = {
            enable = function(tsn)
              local t = tsn:parent():type()
              return not (t == "block" or t == "do_block")
            end,
          },
        }),
      })

      return {
        use_default_keymaps = false,
        langs = lang_utils._prepare_presets(langs.presets),
      }
    end,
  },
}
