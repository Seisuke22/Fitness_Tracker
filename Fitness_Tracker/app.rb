require_relative "../Fitness-Tracker-Project/Models/workout.rb"
require_relative "../Fitness-Tracker-Project/Repository/workout_repo.rb"
require_relative "../Fitness-Tracker-Project/Controller/workout_controller.rb"
require_relative "./router.rb"

# workout = Workout.new(workout_name: "Squats", sets: 3, reps: 10, weight: "15kg")
# p workout

# exercise = Exercise.new(exercise_name: "Leg Day", exercise_description: "Lezgo")
# p exercise
new_workout = Workout.new(workout_name: "Squat", sets: 3, reps: 10)
workout_repo = WorkoutRepository.new("./csv/workout.csv")
controller = WorkoutController.new(workout_repo)

router = Router.new(controller)

router.run
