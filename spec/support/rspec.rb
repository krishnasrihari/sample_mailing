RSpec.configure do |config|
  config.mock_with :rspec
  config.include FactoryGirl::Syntax::Methods
  config.include ActionView::Helpers::NumberHelper
  config.include(EmailSpec::Helpers)
  config.include(EmailSpec::Matchers)
end