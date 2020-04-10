require 'cucumber'
require 'selenium-webdriver'
require 'capybara/dsl'
require 'capybara/cucumber'
require 'capybara-screenshot/cucumber'
require 'rspec'
require 'webdrivers'
require 'site_prism'

require 'byebug'

World(Capybara)

Capybara.register_driver :selenium do |app|
  case ENV["BROWSER"]
    when "chrome"
      args = %w(start-maximized --disable-dev-shm-usage --log-level=7)
    when "headless"
      args = %w(--headless --log-level=3 disable-gpu no-sandbox --disable-dev-shm-usage)
    else
      puts "Browser não selecionado! Rode o cucumber com '-p chrome' ou '-p chrome_headless'"
      Cucumber.wants_to_quit = true
  end
  
  opts = { browser: :chrome, options: Selenium::WebDriver::Chrome::Options.new(
    args: args)}
    
    Capybara::Selenium::Driver.new(app, opts)

end

=begin
opts_firefox = {:browser => :firefox, options: Selenium::WebDriver::Firefox::Options.new(
    args: %w(--disable-gpu start-maximized --no-sandbox --disable-dev-shm-usage))}
opts_foxheadless = {:browser => :firefox, options: Selenium::WebDriver::Firefox::Options.new(
    args: %w(--headless --disable-gpu --no-sandbox --disable-dev-shm-usage))} # --log-level=3
opts_edge = {:browser => :edge, options: Selenium::WebDriver::Edge::Options.new( 
  args: %w(cleanup silent ms:inPrivate))}
=end



Capybara::Screenshot.register_driver(:selenium) do |driver, path|
  driver.browser.save_screenshot path
end

Capybara::Screenshot.webkit_options = {width: 1920, height: 1080}
Capybara::Screenshot.autosave_on_failure = false
Capybara::Screenshot.prune_strategy = :keep_last_run

Capybara.configure do |config|
  config.default_driver = :selenium 
  config.javascript_driver = :webkit
  config.default_max_wait_time = 12
  config.ignore_hidden_elements = false
  config.app_host = 'http://www.netshoes.com.br'
  config.match = :prefer_exact
  config.exact = true
  config.visible_text_only = false
  config.automatic_label_click = true
end

def ss_capture(nome_arquivo, cenario_result)
  caminho_arquivo = "results/screenshots/#{cenario_result}"
  foto = "#{caminho_arquivo}/#{nome_arquivo}.png"
  save_screenshot(foto)
  embed(foto, 'image/png', 'Clique Aqui!')
end

=begin 
def add_browser_logs
  time_now = Time.now
  current_url = Capybara.current_url.to_s # Getting current URL
  logs = page.driver.browser.manage.logs.get(:browser).map {|line| [line.level, line.message]} # Gather browser logs
  logs.reject! { |line| ['WARNING', 'INFO'].include?(line.first) } # Remove warnings and info messages
  logs.any? === true
  embed(time_now.strftime('%Y-%m-%d-%H-%M-%S' + '\n') +
  ('URL: ' + current_url + '\n') +
  logs.join("\n"), 'text/plain', 'BROWSER ERROR')
end
=end