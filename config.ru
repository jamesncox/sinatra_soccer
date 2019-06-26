require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

# use Method::RackOverride
use ManagersController
use TeamStatsController
run ApplicationController
