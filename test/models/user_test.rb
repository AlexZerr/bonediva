require "minitest_helper"

describe User do
  subject { User.new }

  must { have_many :products }

  must { validate_presence_of :name }
  must { validate_presence_of :email }
  must { validate_presence_of :username }
  must { validate_presence_of :password }


end
