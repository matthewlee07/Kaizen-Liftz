admin = User.new(email: "admin@email.com", password: "password", admin: true)
admin.save!

sample = User.new(email: "sampleuser@email.com", password: "password")
sample.save!

Exercise.create!([
    { name: "Bench Press" },
    { name: "Bent over Row" },
    { name: "Bicep Curl" },
    { name: "Crunch" },
    { name: "Deadlift"},
    { name: "Leg Curl" },
    { name: "Leg Extension" },
    { name: "Leg Press" },
    { name: "Lunge" },
    { name: "Pull Up" },
    { name: "Push Up" },
    { name: "Shoulder Fly" },
    { name: "Shoulder Press" },
    { name: "Squat"},
    { name: "Tricep extension" },
    { name: "Upright Row" },
])

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

Intention.create!([
    { exercise_id: 1,  muscle_id: 10, primary_muscle: true  }, 
    { exercise_id: 1,  muscle_id: 3,  primary_muscle: false }, 
    { exercise_id: 1,  muscle_id: 13, primary_muscle: false }, 
    { exercise_id: 2,  muscle_id: 8,  primary_muscle: true  }, 
    { exercise_id: 2,  muscle_id: 2,  primary_muscle: false }, 
    { exercise_id: 3,  muscle_id: 2,  primary_muscle: true  }, 
    { exercise_id: 4,  muscle_id: 1,  primary_muscle: true  }, 
    { exercise_id: 4,  muscle_id: 9,  primary_muscle: false }, 
    { exercise_id: 5,  muscle_id: 4,  primary_muscle: true  }, 
    { exercise_id: 5,  muscle_id: 6,  primary_muscle: true  }, 
    { exercise_id: 5,  muscle_id: 11, primary_muscle: true  }, 
    { exercise_id: 5,  muscle_id: 12, primary_muscle: true  }, 
    { exercise_id: 5,  muscle_id: 1,  primary_muscle: false }, 
    { exercise_id: 5,  muscle_id: 5,  primary_muscle: false }, 
    { exercise_id: 5,  muscle_id: 7,  primary_muscle: false }, 
    { exercise_id: 5,  muscle_id: 8,  primary_muscle: false }, 
    { exercise_id: 6,  muscle_id: 7,  primary_muscle: true  }, 
    { exercise_id: 6,  muscle_id: 6,  primary_muscle: false }, 
    { exercise_id: 7,  muscle_id: 11, primary_muscle: true  }, 
    { exercise_id: 8,  muscle_id: 7,  primary_muscle: true  }, 
    { exercise_id: 8,  muscle_id: 11, primary_muscle: true  }, 
    { exercise_id: 8,  muscle_id: 5,  primary_muscle: false }, 
    { exercise_id: 8,  muscle_id: 6,  primary_muscle: false }, 
    { exercise_id: 9,  muscle_id: 6,  primary_muscle: true  }, 
    { exercise_id: 9,  muscle_id: 7,  primary_muscle: true  }, 
    { exercise_id: 9,  muscle_id: 11, primary_muscle: true  }, 
    { exercise_id: 9,  muscle_id: 5,  primary_muscle: false }, 
    { exercise_id: 10, muscle_id: 8,  primary_muscle: true  }, 
    { exercise_id: 10, muscle_id: 2,  primary_muscle: false }, 
    { exercise_id: 11, muscle_id: 10, primary_muscle: true  }, 
    { exercise_id: 11, muscle_id: 13, primary_muscle: false }, 
    { exercise_id: 12, muscle_id: 3,  primary_muscle: true  }, 
    { exercise_id: 12, muscle_id: 10, primary_muscle: true  }, 
    { exercise_id: 12, muscle_id: 2,  primary_muscle: false }, 
    { exercise_id: 12, muscle_id: 8,  primary_muscle: false }, 
    { exercise_id: 13, muscle_id: 3,  primary_muscle: true  }, 
    { exercise_id: 13, muscle_id: 12, primary_muscle: false }, 
    { exercise_id: 13, muscle_id: 13, primary_muscle: false }, 
    { exercise_id: 14, muscle_id: 6,  primary_muscle: true  }, 
    { exercise_id: 14, muscle_id: 7,  primary_muscle: true  }, 
    { exercise_id: 14, muscle_id: 11, primary_muscle: true  }, 
    { exercise_id: 14, muscle_id: 5,  primary_muscle: false }, 
    { exercise_id: 15, muscle_id: 13, primary_muscle: true  }, 
    { exercise_id: 15, muscle_id: 3,  primary_muscle: false }, 
    { exercise_id: 16, muscle_id: 12, primary_muscle: true  }, 
    { exercise_id: 16, muscle_id: 2,  primary_muscle: false }, 
    { exercise_id: 16, muscle_id: 3,  primary_muscle: false }, 
])

Workout.create!([
    { name: "Big 3"}, 
    { name: "Upper Body" },
    { name: "Lower Body"}, 
    { name: "Big 3", user_id: 2  }, 
    { name: "Upper Body", user_id: 2 },
    { name: "Lower Body", user_id: 1 }
])

Regiment.create!([
    { exercise_id: 1,  workout_id: 1, sets: 5,  reps: 5 , weight: 65  },
    { exercise_id: 5,  workout_id: 1, sets: 5,  reps: 5 , weight: 135 },
    { exercise_id: 14, workout_id: 1, sets: 5,  reps: 5 , weight: 135 },
    { exercise_id: 2,  workout_id: 2, sets: 10, reps: 10, weight: 100 },
    { exercise_id: 3,  workout_id: 2, sets: 10, reps: 10, weight: 25  },
    { exercise_id: 4,  workout_id: 2, sets: 10, reps: 10 },
    { exercise_id: 10, workout_id: 2, sets: 10, reps: 10 },
    { exercise_id: 11, workout_id: 2, sets: 10, reps: 10 },
    { exercise_id: 12, workout_id: 2, sets: 10, reps: 10, weight: 20 },
    { exercise_id: 13, workout_id: 2, sets: 10, reps: 10, weight: 25 },
    { exercise_id: 15, workout_id: 2, sets: 10, reps: 10, weight: 25 },
    { exercise_id: 16, workout_id: 2, sets: 10, reps: 10, weight: 50 },
    { exercise_id: 6,  workout_id: 3, sets: 7,  reps: 7 , weight: 25 },
    { exercise_id: 7,  workout_id: 3, sets: 7,  reps: 7 , weight: 25 },
    { exercise_id: 8,  workout_id: 3, sets: 7,  reps: 7 , weight: 95 },
    { exercise_id: 1,  workout_id: 4, sets: 5,  reps: 5 , weight: 135 },
    { exercise_id: 5,  workout_id: 4, sets: 5,  reps: 5 , weight: 225 },
    { exercise_id: 14, workout_id: 4, sets: 5,  reps: 5 , weight: 185 },
    { exercise_id: 2,  workout_id: 5, sets: 10, reps: 10, weight: 100 },
    { exercise_id: 3,  workout_id: 5, sets: 10, reps: 10, weight: 25  },
    { exercise_id: 4,  workout_id: 5, sets: 10, reps: 10 },
    { exercise_id: 10, workout_id: 5, sets: 10, reps: 10 },
    { exercise_id: 11, workout_id: 5, sets: 10, reps: 10 },
    { exercise_id: 12, workout_id: 5, sets: 10, reps: 10, weight: 20 },
    { exercise_id: 13, workout_id: 5, sets: 10, reps: 10, weight: 25 },
    { exercise_id: 15, workout_id: 5, sets: 10, reps: 10, weight: 25 },
    { exercise_id: 16, workout_id: 5, sets: 10, reps: 10, weight: 50 },
    { exercise_id: 6,  workout_id: 6, sets: 5,  reps: 5 , weight: 25 },
    { exercise_id: 7,  workout_id: 6, sets: 5,  reps: 5 , weight: 25 },
    { exercise_id: 8,  workout_id: 6, sets: 5,  reps: 5 , weight: 25 },
    { exercise_id: 9,  workout_id: 6, sets: 5,  reps: 5 , weight: 25 }
])

Workout_Entry.create!(
    { workout_id: 4, start_time: "2019-06-21 15:00:00", stop_time: "2019-06-21 16:00:00", comments: "Was too tired to try for last set." }
)

Exercise_Entry.create!(
    { workout_entry_id: 1, exercise_id: 1, sets: 5, reps: 5, weight: 65, comments: "Felt light, try 105 pounds next" }, 
    { workout_entry_id: 1, exercise_id: 5, sets: 4, reps: 5, weight: 135, comments: "Felt light, try 205 pounds next" }, 
    { workout_entry_id: 1, exercise_id: 14, sets: 4, reps: 5, weight: 135, comments: "Felt comfortable, but worried about form. Try 155 pounds next" }
)