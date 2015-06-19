@Scores = new Mongo.Collection("scores")

Schemas.Scores = new SimpleSchema
    score: 
        type: Number
    hackathon:
      type: String
      autoform:
        omit: true
    criteria: 
        type: String
    Team: 
        type: String
        autoform:
          omit: true
