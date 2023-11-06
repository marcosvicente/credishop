class RelatoryController < ApplicationController
  def index
    @data_keys = Inss.order(:aliquot).pluck(:aliquot)
    proponent = Proponent.group(:inss_aliquot).count
    @data_values =@data_keys.collect{|d| proponent[d]}
  end
end
