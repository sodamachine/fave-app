require './config/environment'

use Rack::MethodOverride
use UsersController
use FavesController
run ApplicationController