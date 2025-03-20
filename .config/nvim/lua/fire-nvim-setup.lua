vim.g.firenvim_config = {
  globalSettings= {
         alt= 'all',
      },
     localSettings= {
         ['.*']= {
             cmdline= 'neovim',
             content= 'text',
             selector= 'textarea',
         },
     }
}
