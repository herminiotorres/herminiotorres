defmodule FreelancerRates do
  @daily_rate_per_hourly_rate 8.0
  @billable_days 22

  def daily_rate(hourly_rate) do
    hourly_rate
    |> Kernel.*(@daily_rate_per_hourly_rate)
  end

  def apply_discount(before_discount, discount) do
    before_discount - before_discount * (discount / 100)
  end

  def monthly_rate(hourly_rate, discount) do
    hourly_rate
    |> daily_rate()
    |> Kernel.*(@billable_days)
    |> apply_discount(discount)
    |> Kernel.ceil()
  end

  def days_in_budget(budget, hourly_rate, discount) do
    daily_rate_with_discount =
      hourly_rate
      |> daily_rate()
      |> apply_discount(discount)

    budget
    |> Kernel./(daily_rate_with_discount)
    |> Float.floor(1)
  end
end
