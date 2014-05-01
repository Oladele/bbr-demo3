namespace :db do
  desc "Fill database with sample data"
  task populate_users: :environment do
    User.create!(first_name: "David",
                 last_name: "Hall")

    7.times do |n|
      fname  = Faker::Name.last_name
      lname = Faker::Name.first_name
      User.create!(first_name: fname,
                   last_name: lname
                  )

    end
  end

  task populate_wods: :environment do

    user = User.first
      
    exercises = ['Pull-up', 'Push-up', 'Sit-up', 'Squat (Air)', 'Thruster', 'Deadlift', 'Squat (Barbell)', 'Bench Press (Barbell)']
    exercises.each do |exercise|
      user.exercises.create!(name: exercise)
    end

    thruster = Exercise.find_by(name: 'Thruster')
    pullup = Exercise.find_by(name: 'Pull-up')
    pushup = Exercise.find_by(name: 'Push-up')
    situp = Exercise.find_by(name: 'Sit-up')
    squatair = Exercise.find_by(name: 'Squat (Air)')

    # ******************FRAN************************
    # ******************FRAN************************

    fran = user.wod_prototypes.create!(name: 'Fran')
    round1 = fran.blocks.create!(name: "First Round (21 Reps per exercise)", position: 1)
    round2 = fran.blocks.create!(name: "Second Round (15 Reps per exercise)", position: 2)
    round3 = fran.blocks.create!(name: "Third Round (9 Reps per exercise)", position: 3)

    round1set1 = round1.setts.create!(position: 1)
    round1set2 = round1.setts.create!(position: 2)
    
    round2set1 = round2.setts.create!(position: 1)
    round2set2 = round2.setts.create!(position: 2)

    round3set1 = round3.setts.create!(position: 1)
    round3set2 = round3.setts.create!(position: 2)

    # Round 1
    (1..21).each do |position|
      round1set1.reps.create!(exercise_id: thruster.id, resistance: 95, position: position )
    end
    (22..42).each do |position|
      round1set2.reps.create!(exercise_id: pullup.id, resistance: 0, position: position )
    end

    # Round 2
    (1..15).each do |position|
      round2set1.reps.create!(exercise_id: thruster.id, resistance: 95, position: position )
    end
    (16..30).each do |position|
      round2set2.reps.create!(exercise_id: pullup.id, resistance: 0, position: position )
    end

    # Round 3
    (1..9).each do |position|
      round3set1.reps.create!(exercise_id: thruster.id, resistance: 95, position: position )
    end
    (10..18).each do |position|
      round3set2.reps.create!(exercise_id: pullup.id, resistance: 0, position: position )
    end

    # X2 Instances
    Wod.create_from_wod_prototype(user, fran)
    Wod.create_from_wod_prototype(user, fran)

    # ******************ANGIE************************
    # ******************ANGIE************************

    angie = user.wod_prototypes.create!(name: 'Angie')
    round1 = angie.blocks.create!(name: "Only one round *FOR TIME*", position: 1)
    round1set1 = round1.setts.create!(position: 1)
    round1set2 = round1.setts.create!(position: 2)
    round1set3 = round1.setts.create!(position: 3)
    round1set4 = round1.setts.create!(position: 4)

    # Round 1
    (1..100).each do |position|
      round1set1.reps.create!(exercise_id: pullup.id, resistance: 0, position: position )
    end
    (1..100).each do |position|
      round1set2.reps.create!(exercise_id: pushup.id, resistance: 0, position: position )
    end
    (1..100).each do |position|
      round1set3.reps.create!(exercise_id: situp.id, resistance: 0, position: position )
    end
    (1..100).each do |position|
      round1set4.reps.create!(exercise_id: squatair.id, resistance: 0, position: position )
    end

    # X3 Instances
    Wod.create_from_wod_prototype(user, angie)
    Wod.create_from_wod_prototype(user, angie)
    Wod.create_from_wod_prototype(user, angie)
  end

  task populate_wods_more: :environment do

    user = User.first

    # ******************PLACEHOLDERS*****************
    # ******************PLACEHOLDERS*****************

    Legs = user.wod_prototypes.create!(name: 'Legs Heavy (M&F Mag April)')
    Chest = user.wod_prototypes.create!(name: 'Chest Blaster (M&F Mag April)')
    Circuit1 = user.wod_prototypes.create!(name: 'High Intensity Circuit I')
    Circuit2 = user.wod_prototypes.create!(name: 'High Intensity Circuit II')
  end

end