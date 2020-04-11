require 'report_builder'
require 'selenium-webdriver'

options = {
  input_path: 'results/report.json',
  report_path: 'results/Relatorio',
  report_types: ['html'],
  report_title: 'Automação Zup - NetShoes',
  color: 'grey',
  additional_info: {'Projeto' => File.basename(Dir.pwd), 'Ambiente' => 'Prod', 'Navegador' => ENV["BROWSER"].to_s, 'QA' => 'Marcelo Oppenheim Pavone', 'Data' => Time.now.strftime("%d/%m/%Y")}
}

Before do # instanciar todas as paginas do tipo Site Prism
  @home = HomePage.new
  @busca = BuscaPage.new
  @produto = ProdutoPage.new
  @carrinho = CarrinhoPage.new
end

After do |scenario|
  # add_browser_logs # unless ENV["BROWSER"].eql? nil
  p 'Cenario concluido'
  scenario_name = scenario.name.gsub(/\s+/,'_').tr('/','_')
  if scenario.failed?
    ss_capture(scenario_name.downcase!, 'falhou') # Salvando falhas na estrutura de pasta
  # else ss_capture(scenario_name.downcase!, 'passou')
  end
end


at_exit do
  ReportBuilder.build_report options # Gerar relatorio customizado
  puts 'Todos os testes foram concluidos.'
end
