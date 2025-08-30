module ApplicationHelper
  def ldt(time, format = :long)
    time ? l(time, format:) : ''
  end
end
