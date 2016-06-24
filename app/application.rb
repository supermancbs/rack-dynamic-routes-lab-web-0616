class Application
  @@items = []

  def call(env)
   resp = Rack::Response.new
   req = Rack::Request.new(env)
    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      if final = @@items.find {|item| item.name == item_name}
        resp.write final.name
        resp.write final.price
      else 
        resp.write "Item not found"
      end
    else 
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
 end


end 