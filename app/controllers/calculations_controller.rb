class CalculationsController < ApplicationController

  def word_count
    @text = params[:user_text]
    @special_word = params[:user_word]

    # ================================================================================
    @characters_no_spaces = @text.gsub(" ", "")
    @text_into_array = @text.split
    @downcased_input = @special_word.downcase
    # ================================================================================


    @character_count_with_spaces = @text.length

    @character_count_without_spaces = @text.delete(' ').delete("\r\n").length

    @word_count = @text.split.count

    @downcase_text = @text.downcase
    @downcase_array = @downcase_text.split
    @occurrences = @downcase_array.count(@downcased_input)

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("word_count.html.erb")
  end

  def loan_payment
    @apr = params[:annual_percentage_rate].to_f
    @years = params[:number_of_years].to_i
    @principal = params[:principal_value].to_f

    # ================================================================================
    @rate_percent = @apr/100
    @r = @rate_percent/12
    @exponent = @years * -12
    # ================================================================================

    @monthly_payment = (@principal * @r) / (1 - (1 + @r)**@exponent)

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("loan_payment.html.erb")
  end

  def time_between
    @starting = Chronic.parse(params[:starting_time])
    @ending = Chronic.parse(params[:ending_time])

    # ================================================================================

    # ================================================================================

    @seconds = @ending - @starting
    @minutes = @seconds/60
    @hours = @minutes/60
    @days = @hours/24
    @weeks = @days/7
    @years = @days/365

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("time_between.html.erb")
  end

  def descriptive_statistics
    @numbers = params[:list_of_numbers].gsub(',', '').split.map(&:to_f)

    # ================================================================================
    @number_count = @numbers.count
    @middle_value = @number_count / 2

    # ================================================================================

    @sorted_numbers = @numbers.sort

    @count = @number_count

    @minimum = @numbers.min

    @maximum = @numbers.max

    @range = @maximum - @minimum

    if @count.odd?
      @median = @sorted_numbers[@middle_value]
    end

    if @count.even?
      @value_1 = @sorted_numbers[@middle_value -1]
      @value_2 = @sorted_numbers[@middle_value]
      @avg = (@value_2 - @value_1) /2
      @median = @value_1 + @avg
    end

    @sum = @numbers.sum

    @mean = @sum / @count

    @variance_calc = []

    @numbers.each do |num|
      @variance_calc.push((num - @mean)**2)
    end

    @variance_calc_total = @variance_calc.sum

    @variance = (@variance_calc_total / (@count))

    @standard_deviation = Math.sqrt(@variance)


    @mode = "Replace this string with your answer."

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("descriptive_statistics.html.erb")
  end
end
