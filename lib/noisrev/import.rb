require_relative 'core'

Version = Noisrev

module Kernel
  private
  
  def Noisrev(*values)
    ::Noisrev.load_values(*values)
  end
  
  alias_method :Version, :Noisrev
end