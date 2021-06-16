class Lender < ApplicationRecord
  enum ltype: [:loan, :hardmoney]
end
