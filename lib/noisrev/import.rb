require_relative '../noisrev'

Version = Noisrev

module Kernel

  private
  
  def Noisrev(*values)
    ::Noisrev.for_values(*values)
  end
  
  alias_method :Version, :Noisrev

end
