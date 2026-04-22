-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
return {
  {
    'milanglacier/minuet-ai.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('minuet').setup({
        -- Using FIM (Fill-in-the-middle) for better code context
        provider = 'openai_fim_compatible',
        provider_options = {
          openai_fim_compatible = {
            api_key = 'DEEPSEEK_API_KEY', -- Environment variable name
            name = 'deepseek',
            optional = {
              max_tokens = 256,
              top_p = 0.9,
            },
          },
        },
        throttle = 2000,
        debounce = 400,
      })
    end,
  },

  {
    'saghen/blink.cmp',
    opts = {
      keymap = {
        ['<A-y>'] = { function(cmp) cmp.show({ providers = { 'minuet' } }) end },
      },
      sources = {
        default = { 'lsp', 'path', 'buffer', 'snippets', 'minuet' },
        providers = {
          minuet = {
            name = 'minuet',
            module = 'minuet.blink',
            score_offset = 100,
            async = true,
            timeout_ms = 3000, -- LLMs can be slow, 3s is safer
          },
        },
      },
    },
  },
}
