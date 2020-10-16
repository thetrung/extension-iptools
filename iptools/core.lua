-- Put functions in this file to use them in several other scripts.
-- To get access to the functions, you need to put:
-- require "my_directory.my_file"
-- in any script using the functions.

IPTools = {}

function IPTools:new()
	obj = {}

	obj.debug = false

	function obj:get_public_ip(callback)
		http.request('https://api.ipify.org', 'GET', function(self,_,res)
			local ip_addr = res.response
			if obj.debug then print("ip: " .. ip_addr) end
			callback(ip_addr)
		end)
	end

	function obj:get_location(ip_address, callback)
		http.request('https://ipinfo.io/'..ip_address, 'GET', function(self,_,res)
			if obj.debug then print(res.response) end
			if cjson then callback(cjson.decode(res.response))
					 else callback(res.response) 
			end
		end)
	end

	function obj:print_local_ip()
		local ip_address = sys.get_ifaddrs()
		for k,v in pairs(ip_address) do 
			for kv,vv in pairs(v) do 
				print(k .. ". " .. kv .. " -- " .. tostring(vv))
			end
			print("")
		end	
	end
	
	setmetatable(obj, self)
	self.__index = self
	return obj
end

return IPTools
