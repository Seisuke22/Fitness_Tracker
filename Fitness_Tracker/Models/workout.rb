class Workout
  attr_accessor :id, :workout_name, :sets, :reps, :weight
  attr_reader :time_start, :time_finished
  def initialize(attributes = {})
    @id = attributes[:id].to_i
    @workout_name = attributes[:workout_name]
    @sets = attributes[:sets].to_i
    @reps = attributes[:reps].to_i
    @weight = attributes[:weight]
    @time_start = attributes[:time_start]
    @time_finished = attributes[:time_finished]
  end
end
