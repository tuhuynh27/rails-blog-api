#! /bin/bash

if [ -f  tmp/pids/server.pid  ]; then
 cat tmp/pids/server.pid | xargs kill 
fi
export SECRET_KEY_BASE=eee61b8de3fe3db85d6efb5c6bb849db6e9735f2f289787d79b932aebddda7ba525ab1cde5d8154ebd65da6286006dace56f72245bbd8e6c426418bcc906f35c
RAILS_ENV=production rails s -p 4000 >/dev/null &