local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local i = ls.insert_node
local d = ls.dynamic_node
local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmt

-- Helper to get the component name based on filename (or folder name if index/page)
local function get_component_name(_, snip)
	local name = vim.fn.expand("%:t:r")
	if not name or name == "" then
		name = "Component"
	elseif name == "index" or name == "page" then
		local parent = vim.fn.expand("%:p:h:t")
		if parent and parent ~= "" and parent ~= "." then
			-- Strip route groups like (auth) or brackets like [id]
			local clean = parent:gsub("^%((.+)%)$", "%1"):gsub("^%[+(.+)%]+$", "%1")
			if clean ~= "" then
				clean = clean:gsub("[-_](%w)", function(c)
					return c:upper()
				end)
				name = clean
			end
		end
	end
	return sn(nil, { i(1, name) })
end

return {
	-- rsc: React Stateless Component (as in VS Code ES7+ snippet)
	-- Focuses on component name first, editing it synchronizes both declaration and export default in parallel
	s(
		{
			trig = "r",
			name = "React Stateless Component",
			dscr = "Creates a React component with import, arrow function, and export default (parallel rename)",
		},
		fmt(
			[[
// import React from 'react';

const {} = () => {{
  return (
    <div>
      {}
    </div>
  );
}};

export default {};
]],
			{
				d(1, get_component_name),
				i(2),
				rep(1),
			}
		)
	),

	-- rafce: React Arrow Function Component with export default
	s(
		{
			trig = "rafce",
			name = "React Arrow Function Component Export",
			dscr = "Creates a React Arrow Function Component with export default (parallel rename)",
		},
		fmt(
			[[
import React from 'react';

const {} = () => {{
  return (
    <div>
      {}
    </div>
  );
}};

export default {};
]],
			{
				d(1, get_component_name),
				i(2),
				rep(1),
			}
		)
	),

	-- rfc: React Function Component with export default
	s(
		{
			trig = "rfc",
			name = "React Function Component",
			dscr = "Creates a standard React Function Component with export default (parallel rename)",
		},
		fmt(
			[[
import React from 'react';

function {}() {{
  return (
    <div>
      {}
    </div>
  );
}}

export default {};
]],
			{
				d(1, get_component_name),
				i(2),
				rep(1),
			}
		)
	),

	-- b: Arrow component with div (without React import)
	s(
		{
			trig = "b",
			name = "Arrow Component (div)",
			dscr = "Component with div and export default (parallel rename)",
		},
		fmt(
			[[
const {} = () => {{
  return (
    <div>
      {}
    </div>
  );
}};

export default {};
]],
			{
				d(1, get_component_name),
				i(2),
				rep(1),
			}
		)
	),

	-- a: Arrow component with fragment (without React import)
	s(
		{
			trig = "a",
			name = "Arrow Component (fragment)",
			dscr = "Component with fragment and export default (parallel rename)",
		},
		fmt(
			[[
const {} = () => {{
  return (
    <>
      {}
    </>
  );
}};

export default {};
]],
			{
				d(1, get_component_name),
				i(2),
				rep(1),
			}
		)
	),
}
