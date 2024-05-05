require_relative "../Models/workout.rb"
require_relative "../View/view.rb"
require_relative "../Repository/workout_repo.rb"

class WorkoutController
  def initialize(workouts)
    @workouts = workouts
    @view = View.new
  end

  def list
    @view.display_workout(@workouts.all)
  end

  def create_workout
    workout_name = @view.get_workout_name
    sets_count = @view.get_sets
    reps_count = @view.get_reps
    weight_count = @view.get_weight
    create_workout = Workout.new(workout_name: workout_name, sets: sets_count, reps: reps_count, weight: weight_count)
    @workouts.add_workout(create_workout)
  end

  def delete!
    index_input = @view.get_index
    @workouts.destroy(index_input)
  end

  def edit!
    index_input = @view.get_index
    count_input = @view.new_count
    @workouts.change(index_input, count_input)
  end
end
