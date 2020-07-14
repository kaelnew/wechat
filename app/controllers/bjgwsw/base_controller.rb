class Bjgwsw::BaseController < ApplicationController
  layout 'bjgwsw', except: %i(introduce)

  def introduce
    render layout: false
  end

  def contact
  end

  def coorperate
  end

  def wcqgxb
  end

  def myxb
  end

  def zfgxb
  end

  def cclc
  end
end
