require_relative "../Models/workout.rb"
require "csv"

class WorkoutRepository
  def initialize(csv_path)
    @csv_path = csv_path
    @workouts = []
    @next_id = 1
    load_csv if File.exist?(csv_path)
  end

  def add_workout(workout)
    workout.id = @next_id
    @next_id += 1
    @workouts << workout
    save_csv
  end

  def all
   @workouts
  end


  def destroy(workout_index)
    @workouts.delete_at(workout_index)
    save_csv
  end

  def mark_complete(index)
    workout = @workouts[index]
    workout.complete = true
    save_csv
  end


  # def change(workout_index, new_count)
  #   @workouts[workout_index] = "#{new_count}"
  #   saave_csv
  # end

 private

  def load_csv
    CSV.foreach(@csv_path, headers: :first_row, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      workout = Workout.new(row)
      @workouts << workout
      # room = @room_repo.find(row[:room_id].to_i)
    end
    @next_id = @workouts.empty? ? 1 : @workouts.last.id + 1
  end

  def save_csv
    CSV.open(@csv_path, "wb", :write_headers => true, :headers => ["id", "workout_name", "sets", "reps", "weight", "time_start", "time_finished"]) do |csv|
      @workouts.each do |workout|
        csv << [workout.id, workout.workout_name, workout.sets, workout.reps, workout.weight, workout.time_start, workout.time_finished]
      end
    end
  end

end
