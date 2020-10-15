### Extension for easy IP related Tools

#### 1. Add it as defold extension : 

    https://github.com/thetrung/extension-iptools/archive/master.zip
    
    
#### 2. Usage :

1. Init & Enable debug :

        local IPTools = require('iptools.core'):new()
        IPTools.debug = true


2. Get your client public IP

        IPTools:get_public_ip(function(ip_address)
          print(ip_address)
        end)
  
  
3. Get your client GeoLocation 

        IPTools:get_location(ip_address, function(info)
          for k,v in pairs(info) do 
            print(k .. " = " .. v)
          end
        end)

4. Print all local ip address ( with MAC )

        IPTools:print_local_ip()
