require 'benchmark'

class String
  def method_missing(method, *args)
    method == :ghost_reverse ? reverse : super
  end
end

Benchmark.bm(13) do |x|
  x.report 'Normal method' do
    1000000.times { 'abc'.reverse }
  end

  x.report 'Ghost method' do
    1000000.times { 'abc'.ghost_reverse }
  end
end
