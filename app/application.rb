require 'pry'

class Application


def call(env)
  resp= Rack::Response.new
  req= Rack::Request.new(env)


  if req.path.match(/items/)
    item_name=req.path.split("/items/").last

    finalitem=nil
    @@items.each do |item|
      if item.name==item_name
        finalitem=item
      end
    end



    if finalitem == nil 
      resp.status = 400
      resp.write "Item not found"
    else
      resp.write finalitem.price
    end
  else
    resp.status =404
    resp.write "Route not found"
  end

  resp.finish


end



end