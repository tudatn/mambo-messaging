# -*- encoding : utf-8 -*-
module Messaging
  class Engine < Rails::Engine
    isolate_namespace Messaging

    initializer "dependencies" do
    	require("messaging/responder")
    	require("messaging/service")
    end
  end
end
