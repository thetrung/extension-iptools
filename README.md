### Extension for easy IP related Tools

#### 1. Add it as defold extension : 

        https://github.com/thetrung/extension-iptools/archive/master.zip
    
    
#### 2. Usage :

* Note : `cjson` is optional, but if you use it, then `get_location` will return a nice table instead of string.

        https://github.com/Melsoft-Games/defold-cjson/archive/master.zip

1. Init & Enable debug :

        local IPTools = require('iptools.core')
        IPTools.debug = true
        IPTools.config('your_ipinfo_token')-- register your free 50k req/month at IPinfo.io


2. Get your client public IP

        IPTools:get_public_ip(function(ip_address)
          print(ip_address)
        end)
  
  
3. Get your client GeoLocation 

        IPTools:get_ipinfo(function(info)
          for k,v in pairs(info) do 
            print(k .. " = " .. v)
          end
        end)

4. Print all local ip address ( with MAC )

        IPTools:print_local_ip()
