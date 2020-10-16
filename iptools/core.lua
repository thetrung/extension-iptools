local M = {}

M.debug = false
M.token = "" -- defaultly use my test account

function M.config(ipinfo_token)
	M.token = ipinfo_token
end

function M.get_public_ip(callback)
	http.request('https://api.ipify.org', 'GET', function(self,_,res)
		local ip_addr = res.response
		if M.debug then print("ip: " .. ip_addr) end
		callback(ip_addr)
	end)
end

function M.get_ipinfo(callback)
	-- curl  -H "Accept: application/json" ipinfo.io/json
	-- curl -H "Authorization: Bearer $TOKEN" ipinfo.io
	local header = { 
		["Accept"] = "application/json",
		["Authorization"] = "Bearer " .. M.token
	}
	http.request('https://ipinfo.io/json', 'GET', function(self,_,res)
		if M.debug then print(res.response) end
		if cjson then callback(cjson.decode(res.response))
				 else callback(res.response) 
		end
	end, header)
end

function M.print_local_ip()
	local ip_address = sys.get_ifaddrs()
	for k,v in pairs(ip_address) do 
		for kv,vv in pairs(v) do 
			print(k .. ". " .. kv .. " -- " .. tostring(vv))
		end
		print("")
	end	
end

return M