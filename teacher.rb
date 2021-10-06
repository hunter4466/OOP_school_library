require_relative 'Person'

class Teacher < Person
  def specialization
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
