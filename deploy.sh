#! /bin/bash

if [ -f  tmp/pids/server.pid  ]; then
 cat tmp/pids/server.pid | xargs kill 
fi
# export SECRET_KEY_BASE=eee61b8de3fe3db85d6efb5c6bb849db6e9735f2f289787d79b932aebddda7ba525ab1cde5d8154ebd65da6286006dace56f72245bbd8e6c426418bcc906f35c
# RAILS_ENV=production rails s -p 4000 &

export SECRET_KEY_BASE=9513117af05abd70e323ef4752e266aa15104a03c1c4096b637575b59a893eff614039db73de99b60217f5ae03fba0ee81e323c98819c3343cdf32ea53693750
RAILS_ENV=development rails s -p 4000 &