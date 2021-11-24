# frozen_string_literal: true

Kaminari.configure do |config|
  config.default_per_page = 16
  # config.max_per_page = nil
  # config.window = 4
  # config.outer_window = 0
  # config.left = 0
  # config.right = 0
  config.page_method_name = :page_nemo_method
  config.param_name = :page_haha
  # config.max_pages = nil
  # config.params_on_first_page = false
end
