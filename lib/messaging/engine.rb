#- This Source Code Form is subject to the terms of the Mozilla Public
#- License, v. 2.0. If a copy of the MPL was not distributed with this
#- file, You can obtain one at http://mozilla.org/MPL/2.0/.

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
