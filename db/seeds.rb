admin = User.new(email: "admin@email.com", password: "password")
admin.save!

sample = User.new(email: "sampleuser@email.com", password: "password")
sample.save!


Exercise.create!([
    { name: "Bench Press" },
    { name: "Bent over Row" },
    { name: "Bicep Curl" },
    { name: "Crunch Curl" },
    { name: "Deadlift", comments: "Back straight, look tilted down, hook grip" },
    { name: "Leg Curl" },
    { name: "Leg Extension" },
    { name: "Leg Press" },
    { name: "Lunge" },
    { name: "Pull Up" },
    { name: "Push Up" },
    { name: "Shoulder Fly" },
    { name: "Shoulder Press" },
    { name: "Squat", comments: "Widen stance, squeeze core, keep back straight, move torso vertically not a hinge" },
    { name: "Tricep extension" },
    { name: "Upright Row" },
])

Muscle.create!([
    { name:'Abdominals' },
    { name:'Biceps' },
    { name:'Deltoid' },
    { name:'Erector Spinae' },
    { name:'Gastrocnemius & Soleus' },
    { name:'Gluteus Maximus' },
    { name:'Hamstrings' },
    { name:'Latissiumus Dorsi & Rhomboids' },
    { name:'Obliques' },
    { name:'Pectoralis' },
    { name:'Quadriceps' },
    { name:'Trapezius' },
    { name:'Triceps '}
])

Intention.create!([
    { exercise_id: 1,  muscle_id: 3,  primary_muscle: false }, 
    { exercise_id: 1,  muscle_id: 4,  primary_muscle: false }, 
    { exercise_id: 1,  muscle_id: 10, primary_muscle: true  },
    { exercise_id: 1,  muscle_id: 12, primary_muscle: false },
    { exercise_id: 1,  muscle_id: 13, primary_muscle: true  },   
    { exercise_id: 5,  muscle_id: 1,  primary_muscle: false },
    { exercise_id: 5,  muscle_id: 4,  primary_muscle: true  },
    { exercise_id: 5,  muscle_id: 5,  primary_muscle: false },
    { exercise_id: 5,  muscle_id: 6,  primary_muscle: true  },
    { exercise_id: 5,  muscle_id: 7,  primary_muscle: true  },
    { exercise_id: 5,  muscle_id: 8,  primary_muscle: false },
    { exercise_id: 5,  muscle_id: 11, primary_muscle: true  },
    { exercise_id: 5,  muscle_id: 12, primary_muscle: false },
    { exercise_id: 14, muscle_id: 1,  primary_muscle: false },
    { exercise_id: 14, muscle_id: 4,  primary_muscle: false }, 
    { exercise_id: 14, muscle_id: 5,  primary_muscle: false }, 
    { exercise_id: 14, muscle_id: 6,  primary_muscle: true  }, 
    { exercise_id: 14, muscle_id: 7,  primary_muscle: false },
    { exercise_id: 14, muscle_id: 11, primary_muscle: true  }    
])

Workout.create!([
    { name: "Full Body"  }, 
    { name: "Upper Body" },
    { name: "Lower Body" }
])

Regiment.create!([
    { exercise_id: 1,  workout_id: 1, weight: 10, sets: 5, reps: 5 },
    { exercise_id: 2,  workout_id: 1, weight: 10, sets: 5, reps: 5 },
    { exercise_id: 5,  workout_id: 1, weight: 10, sets: 5, reps: 5 },
    { exercise_id: 14, workout_id: 1, weight: 10, sets: 5, reps: 5 },
    { exercise_id: 1,  workout_id: 2, weight: 10, sets: 5, reps: 5 },
    { exercise_id: 2,  workout_id: 2, weight: 10, sets: 5, reps: 5 },
    { exercise_id: 3,  workout_id: 2, weight: 10, sets: 5, reps: 5 },
    { exercise_id: 10, workout_id: 2, weight: 10, sets: 5, reps: 5 },
    { exercise_id: 11, workout_id: 2, weight: 10, sets: 5, reps: 5 },
    { exercise_id: 12, workout_id: 2, weight: 10, sets: 5, reps: 5 },
    { exercise_id: 13, workout_id: 2, weight: 10, sets: 5, reps: 5 },
    { exercise_id: 15, workout_id: 2, weight: 10, sets: 5, reps: 5 },
    { exercise_id: 16, workout_id: 2, weight: 10, sets: 5, reps: 5 },
    { exercise_id: 5,  workout_id: 3, weight: 10, sets: 5, reps: 5 },
    { exercise_id: 6,  workout_id: 3, weight: 10, sets: 5, reps: 5 },
    { exercise_id: 7,  workout_id: 3, weight: 10, sets: 5, reps: 5 },
    { exercise_id: 8,  workout_id: 3, weight: 10, sets: 5, reps: 5 },
    { exercise_id: 9,  workout_id: 3, weight: 10, sets: 5, reps: 5 },
    { exercise_id: 14, workout_id: 3, weight: 10, sets: 5, reps: 5 }
])

Log.create!([
    { user_id: 1, regiment_id: 1 },
    { user_id: 1, regiment_id: 2 },
    { user_id: 2, regiment_id: 1 },
    { user_id: 2, regiment_id: 1 },
    { user_id: 2, regiment_id: 3 },
])