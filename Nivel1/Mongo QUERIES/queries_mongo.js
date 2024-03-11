/*1*/ db.Restaurantes.find({})

/*2*/ db.Restaurantes.find({}, { restaurante_id: 1, name: 1, borough: 1, cuisine: 1 })

/*3*/ db.Restaurantes.find({}, { _id: 0, restaurante_id: 1, name: 1, borough: 1, cuisine: 1 })

/*4*/ db.Restaurantes.find({}, { _id: 0, restaurante_id: 1, name: 1, borough: 1, "address.zipcode": 1 })

/*5*/ db.Restaurantes.find({ borough: "Bronx" })

/*6*/ db.Restaurantes.find({ borough: "Bronx" }).limit(5)

/*7*/ db.Restaurantes.find({ borough: "Bronx" }).skip(5).limit(5)

/*8*/ db.Restaurantes.find({ "grades.score": { $gt: 90 } })

/*9*/ db.Restaurantes.find({ "grades.score": { $gt: 80, $lt: 100 } })

/*10*/ db.Restaurantes.find({ "address.coord.0": { $lt: -95.754168 } })

/*11*/ db.Restaurantes.find({ cuisine: { $ne: "American" }, "grades.score": { $gt: 70 }, "address.coord.1": { $lt: -65.754168 } })

/*12*/ db.Restaurantes.find({ cuisine: { $ne: "American" }, "grades.score": { $gt: 70 }, "address.coord.0": { $lt: -65.754168 } })

/*13*/ db.Restaurantes.find({ cuisine: { $ne: "American" }, "grades.grade": "A", borough: { $ne: "Brooklyn" } }).sort({ cuisine: -1 })

/*14*/ db.Restaurantes.find({ name: { $regex: /^Wil/i } })

/*15*/ db.Restaurantes.find({ name: { $regex: /ces$/i } })

/*16*/ db.Restaurantes.find({ name: { $regex: /Reg/i } })

/*17*/ db.Restaurantes.find({ borough: "Bronx", cuisine: { $in: ["American", "Chinese"] } })

/*18*/ db.Restaurantes.find({ borough: { $in: ["Staten Island", "Queens", "Bronx", "Brooklyn"] } })

/*19*/ db.Restaurantes.find({ borough: { $nin: ["Staten Island", "Queens", "Bronx", "Brooklyn"] } })

/*20*/ db.Restaurantes.find({ "grades.score": { $lt: 10 } })

/*21*/ db.Restaurantes.find({ cuisine: "seafood", name: { $not: /^Wil/ }, $nor: [{ cuisine: "American" }, { cuisine: "Chinese" }] })

/*22*/ db.Restaurantes.find({ "grades.grade": "A", "grades.score": 11, "grades.date": ISODate("2014-08-11T00:00:00Z") })
