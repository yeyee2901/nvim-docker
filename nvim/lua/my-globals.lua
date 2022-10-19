API = vim.api
GET_NAMESPACES = API.nvim_get_namespaces

INSPECT = function(in_table)
  print(vim.inspect(in_table))
end
