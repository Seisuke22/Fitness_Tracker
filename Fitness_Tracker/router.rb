class Router
  def initialize(controller)
    @controller = controller
    @running = true

  end

  def stop
    @running = false
  end

  def run
    while @running
      display_task
      action = gets.chomp.to_i
      route_action(action)
    end
  end

  def route_action(action)
    case action
    when 1 then @controller.list
    when 2 then @controller.create_workout
    when 3 then @controller.delete!
    when 4 then @controller.mark!
    when 5 then stop
    else
       puts "Invalid input"
    end
  end

  private

  def display_task
  puts " Welcome to the Fitness Tracker Project"
  puts "1 - List all workouts"
  puts "2 - Add Workout"
  puts "3 - Remove Workout"
  puts "4 - Mark Workout"
  puts "5 - Quit App"
  end
end
