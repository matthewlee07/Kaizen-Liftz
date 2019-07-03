admin = User.new(email: "admin@email.com", password: "password", admin: true)
admin.save!

sample = User.new(email: "sampleuser@email.com", password: "password")
sample.save!

Muscle.create!([
    { name:'Abdominals' },
    { name:'Biceps' },
    { name:'Deltoid' },
    { name:'Erector Spinae (Lower Back)' },
    { name:'Gastrocnemius & Soleus (Calves)' },
    { name:'Gluteus Maximus (Buttocks)' },
    { name:'Hamstrings' },
    { name:'Latissimus Dorsi & Rhomboids (Upper Back)' },
    { name:'Obliques' },
    { name:'Pectoralis' },
    { name:'Quadriceps' },
    { name:'Trapezius' },
    { name:'Triceps'}
])

# Exercises

exercise = Exercise.new(name: "Bench Press")
exercise.intentions.build([
  { muscle_id: 10, primary_muscle: true  },
  { muscle_id: 3,  primary_muscle: false },
  { muscle_id: 13, primary_muscle: false }
])
exercise.save!

exercise = Exercise.new(name: "Bent Over Row")
exercise.intentions.build([
  { muscle_id: 8,  primary_muscle: true },
  { muscle_id: 2, primary_muscle: false  }
])
exercise.save!

exercise = Exercise.new(name: "Bicep Curl")
exercise.intentions.build([
  { muscle_id: 2, primary_muscle: true  }
])
exercise.save!

exercise = Exercise.new(name: "Crunch")
exercise.intentions.build([
  { muscle_id: 1, primary_muscle: true  },
  { muscle_id: 9,  primary_muscle: false }
])
exercise.save!

exercise = Exercise.new(name: "Deadlift")
exercise.intentions.build([
  { muscle_id: 4, primary_muscle: true   },
  { muscle_id: 6, primary_muscle: true   },
  { muscle_id: 11, primary_muscle: true  },
  { muscle_id: 12, primary_muscle: true  },
  { muscle_id: 1,  primary_muscle: false },
  { muscle_id: 5,  primary_muscle: false },
  { muscle_id: 7,  primary_muscle: false },
  { muscle_id: 8,  primary_muscle: false },
])
exercise.save!

exercise = Exercise.new(name: "Leg Curl")
exercise.intentions.build([
  { muscle_id: 7, primary_muscle: true   },
  { muscle_id: 6,  primary_muscle: false }
])
exercise.save!

exercise = Exercise.new(name: "Leg Extension")
exercise.intentions.build([
  { muscle_id: 11, primary_muscle: true  }
])
exercise.save!

exercise = Exercise.new(name: "Leg Press")
exercise.intentions.build([
  { muscle_id: 7, primary_muscle: true   },
  { muscle_id: 11, primary_muscle: true  },
  { muscle_id: 5,  primary_muscle: false },
  { muscle_id: 6, primary_muscle: false  }
])
exercise.save!

exercise = Exercise.new(name: "Lunge")
exercise.intentions.build([
    { muscle_id: 6, primary_muscle: true   },
    { muscle_id: 7, primary_muscle: true   },
    { muscle_id: 11, primary_muscle: true  },
    { muscle_id: 5,  primary_muscle: false }
])
exercise.save!

exercise = Exercise.new(name: "Pull Up")
exercise.intentions.build([
  { muscle_id: 8,  primary_muscle: true  },
  { muscle_id: 2,  primary_muscle: false },
])
exercise.save!

exercise = Exercise.new(name: "Push Up")
exercise.intentions.build([
  { muscle_id: 10, primary_muscle: true  },
  { muscle_id: 13, primary_muscle: false }
])
exercise.save!

exercise = Exercise.new(name: "Shoulder Fly")
exercise.intentions.build([
  { muscle_id: 3,  primary_muscle: true  },
  { muscle_id: 10, primary_muscle: true  },
  { muscle_id: 2,  primary_muscle: false },
  { muscle_id: 8,  primary_muscle: false }
])
exercise.save!

exercise = Exercise.new(name: "Shoulder Press")
exercise.intentions.build([
  { muscle_id: 3,  primary_muscle: true  },
  { muscle_id: 12, primary_muscle: false },
  { muscle_id: 13, primary_muscle: false }
])
exercise.save!

exercise = Exercise.new(name: "Squat")
exercise.intentions.build([
  { muscle_id: 6, primary_muscle: true   },
  { muscle_id: 7, primary_muscle: true   },
  { muscle_id: 11, primary_muscle: true  },
  { muscle_id: 5,  primary_muscle: false }
])
exercise.save!

exercise = Exercise.new(name: "Tricep Extension")
exercise.intentions.build([
  { muscle_id: 13, primary_muscle: true  },
  { muscle_id: 3,  primary_muscle: false },
])
exercise.save!

exercise = Exercise.new(name: "Upright Row")
exercise.intentions.build([
  { muscle_id: 12, primary_muscle: true  },
  { muscle_id: 2,  primary_muscle: false },
  { muscle_id: 3,  primary_muscle: false }
])
exercise.save!

# Workouts

workout = Workout.new(name:"Big 3")
workout.regiments.build([
  { exercise_id: 1,  sets: 5,  reps: 5 , weight: 65  },
  { exercise_id: 5,  sets: 5,  reps: 5 , weight: 135 },
  { exercise_id: 14, sets: 5,  reps: 5 , weight: 135 }
])
workout.save!

workout = Workout.new(name:"Upper Body")
workout.regiments.build([
  { exercise_id: 2,  sets: 10, reps: 10, weight: 100 },
  { exercise_id: 3,  sets: 10, reps: 10, weight: 25  },
  { exercise_id: 4,  sets: 10, reps: 10 },
  { exercise_id: 10, sets: 10, reps: 10 },
  { exercise_id: 11, sets: 10, reps: 10 },
  { exercise_id: 12, sets: 10, reps: 10, weight: 20 },
  { exercise_id: 13, sets: 10, reps: 10, weight: 25 },
  { exercise_id: 15, sets: 10, reps: 10, weight: 25 },
  { exercise_id: 16, sets: 10, reps: 10, weight: 50 }
])
workout.save!

workout = Workout.new(name:"Lower Body")
workout.regiments.build([
  { exercise_id: 6, sets: 7,  reps: 7 , weight: 25 },
  { exercise_id: 7, sets: 7,  reps: 7 , weight: 25 },
  { exercise_id: 8, sets: 7,  reps: 7 , weight: 95 },
    
])
workout.save!

# User's Workouts

workout = Workout.new(name:"Big 3", user_id: 1)
workout.regiments.build([
  { exercise_id: 1,  sets: 5,  reps: 5 , weight: 65  },
  { exercise_id: 5,  sets: 5,  reps: 5 , weight: 135 },
  { exercise_id: 14, sets: 5,  reps: 5 , weight: 135 }
])
workout.save!

workout = Workout.new(name:"Upper Body", user_id: 2 )
workout.regiments.build([
  { exercise_id: 2,  sets: 10, reps: 10, weight: 100 },
  { exercise_id: 3,  sets: 10, reps: 10, weight: 25  },
  { exercise_id: 4,  sets: 10, reps: 10 },
  { exercise_id: 10, sets: 10, reps: 10 },
  { exercise_id: 11, sets: 10, reps: 10 },
  { exercise_id: 12, sets: 10, reps: 10, weight: 20 },
  { exercise_id: 13, sets: 10, reps: 10, weight: 25 },
  { exercise_id: 15, sets: 10, reps: 10, weight: 25 },
  { exercise_id: 16, sets: 10, reps: 10, weight: 50 }
])
workout.save!

workout = Workout.new(name:"Lower Body", user_id: 2 )
workout.regiments.build([
  { exercise_id: 6, sets: 7,  reps: 7 , weight: 25 },
  { exercise_id: 7, sets: 7,  reps: 7 , weight: 25 },
  { exercise_id: 8, sets: 7,  reps: 7 , weight: 95 },
    
])
workout.save!

WorkoutEntry.create!(
  { workout_id: 4, start_time: "2019-06-21 15:00:00", stop_time: "2019-06-21 16:00:00", comments: "Was too tired to try for last set." }
)

ExerciseEntry.create!([
  { workout_entry_id: 1, exercise_id: 1,  sets: 6, reps: 5, weight: 65, comments: "Felt light, try 105 pounds next" }, 
  { workout_entry_id: 1, exercise_id: 5,  sets: 6, reps: 5, weight: 135, comments: "Felt light, try 205 pounds next" }, 
  { workout_entry_id: 1, exercise_id: 14, sets: 6, reps: 5, weight: 135, comments: "Felt comfortable, but worried about form. Try 155 pounds next" }
])