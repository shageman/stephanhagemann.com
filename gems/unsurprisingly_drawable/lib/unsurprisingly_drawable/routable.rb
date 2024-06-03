# typed: strict

module UnsurprisinglyDrawable
  module Routable
    extend T::Sig
    extend T::Helpers
    interface!

    # Method that returns route file name
    sig { abstract.returns(String) }
    def route_file_name; end
  end
end
