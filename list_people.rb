class ListPeople
  def list_people(students, teachers)
    if students.empty? && teachers.empty?
      puts 'No people were found...'
      return false
    end
    count = 0
    students.each do |e|
      puts "#{count}) [Student] Name: #{e.name}, ID: #{e.id}, Age: #{e.age}, Parent-permission: #{e.parentperm ? 'Yes' : 'No'}"
      count += 1
    end
    teachers.each do |e|
      puts "#{count}) [Teacher] Name: #{e.name}, ID: #{e.id}, Age: #{e.age}"
      count += 1
    end
  end
end
