class RelatoryController < ApplicationController
  def index
    aliquot = Inss.order(:aliquot).pluck(:aliquot)
    @data_keys = Inss.order(:aliquot).pluck(:from, :to)
    proponent = Proponent.group(:inss_aliquot).count
    @data_values = aliquot.collect{|d| proponent[d]}
  end
end
