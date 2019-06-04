//
//  SampleData.swift
//  Move U
//
//  Created by Jaime Casado Aparicio on 3/6/19.
//  Copyright © 2019 Jaime Casado Aparicio. All rights reserved.
//

import Foundation

var defaultExercises: [Exercise] = [
                                    Exercise(name: "Dead Hang",
                                             photo: "deadHang",
                                             area: "Upper body",
                                             dificulty: "Low",
                                             description: "Cuelgate de una barra que te permita estirarte por completo e intenta eliminar la resistencia que generan los musculos sobre tus hombros. Realiza de 1-3 series a 30 segundos cada una."),
                                    Exercise(name: "Inverted Hang",
                                             photo: "invertedHang",
                                             area: "Upper body",
                                             dificulty: "Low/Medium",
                                             description: "Cuelgate de una barra que te permita estirarte por completo e intenta eliminar la resistencia que generan los musculos sobre tus hombros. Realiza de 1-3 series a 30 segundos cada una.")
]

var defaultWorkouts: [Workout] = [
                                    Workout(name: "Shoulders Rehab",
                                            photo: "shoulderStability",
                                            goal: "Rehabilitar la articulacion glenohumeral para recuperar su movilidad natural y potenciar la estabilidad necesaria para la realizacion de ejercicios mas exigentes",
                                            level: "Beginner",
                                            exercises: [defaultExercises[0],
                                                        defaultExercises[1]])
]

var defaultNutrients: [Nutrient] = [
                                    Nutrient(name: "Proteina",
                                             photo: "proteina",
                                             funtion: "Reparadora y energetica",
                                             recomendedQty: "0,8-1,5g por Kg de masa",
                                             calorieGram: 4)
]
