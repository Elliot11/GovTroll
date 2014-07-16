# Attributes:
# * id [integer, primary, not null] - primary key
# * created_at [datetime] - creation time
# * email [string]
# * facebook [string] - TODO: document me
# * first_name [string] - TODO: document me
# * last_name [string] - TODO: document me
# * twitter [string] - TODO: document me
# * updated_at [datetime] - last update time
class Contact < ActiveRecord::Base
end
