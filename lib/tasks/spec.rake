RSpec::Core::RakeTask.new(:unit) do |t|
  t.pattern = Dir['spec/*/**/*_spec.rb'].reject { |f| f['/features'] }
  t.rspec_opts = '--format documentation --format html --out tmp/unit_test_results.html'
end

RSpec::Core::RakeTask.new(:integration) do |t|
  ENV['DONT_MEASURE_COVERAGE'] = 'true'
  t.pattern = Dir['spec/features/**/*_spec.rb']
  t.rspec_opts = '--tag integration --format documentation --format html --out tmp/integration_test_results.html'
end
