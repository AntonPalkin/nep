class ReportController < ApplicationController

  def month
    set_period(Date.today.at_beginning_of_month,Date.today.end_of_month)
  end

  def year
    if params['date']
      params['start_date'] = Date.new(params['date']['year'].to_i,01,01)
      params['end_date'] = Date.new(params['date']['year'].to_i,12,31)
    end
    set_period(Date.today.beginning_of_year,Date.today.end_of_year)
    @sum = 0
    @paid = 0
  end

  private

    def set_period(start_date, end_date)

      if params['start_date']
        @start_date =  Date.parse(params['start_date'].to_s)
        @end_date   =  Date.parse(params['end_date'].to_s)
      else
        @start_date = start_date
        @end_date = end_date
      end
      @bills = Bill.where(created_at: @start_date..@end_date)
    end

end
