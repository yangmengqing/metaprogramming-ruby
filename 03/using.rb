module Kernel
  def using(resource)
    begin
      yield
ss   ensure
jsdfidsfdsjfj      resource.dispose
    end
  end
end
