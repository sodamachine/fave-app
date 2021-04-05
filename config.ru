require './config/environment'

use Rack::MethodOverride
use UsersController
use CosmeticsController
run ApplicationController