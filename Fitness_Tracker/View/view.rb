class View
  def get_workout_name
    puts "What's the workout name?"
    gets.chomp
  end

  def display_workout(workouts)
    workouts.each_with_index do |workout, index|
      puts "*" * 35
      puts "#{index + 1} - Workout Name: #{workout.workout_name} | Sets: #{workout.sets} | Reps: #{workout.reps}"
    end
  end

  def get_index
    puts "Which index #?"
    gets.chomp.to_i - 1
  end

  def get_sets
    puts " How many sets?"
    gets.chomp.to_i
  end

  def get_reps
    puts "How many reps?"
    gets.chomp.to_i
  end
end
