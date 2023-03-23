import Fluent
import Vapor

struct JokesResponse: Content {
    let status: Int
    let jokes: [Joke]
    let jokeMessage: String
}
struct Joke: Content {
    let title: String
    let id: Int
    let joke: String
}


struct JokesRequest : Content {
    let category : String
}



func routes(_ app: Application) throws {
    
    
   
    var JokeArr = [Joke(title: "Joke1", id: 1, joke: "Why did the opera singer go sailing? They wanted to hit the high Cs."), Joke(title: "Joke 2", id: 02, joke: "I'm practicing for a bug-eating contest and I've got butterflies in my stomach."), Joke(title: "Joke 3", id: 3, joke: "Why don’t skeletons ever go trick or treating? Because they have nobody to go with."), Joke(title: "Joke 4", id: 4, joke: "I was fired from the keyboard factory yesterday. I wasn't putting in enough shifts."), Joke(title: "Joke 5", id: 5, joke: "Have you heard of the band 1023MB? They haven't got a gig yet.")]
    
   
    
//    app.get("jokes") { req -> EventLoopFuture <View> in
//        
//        
//       
//        
//         
//        
//        return req.view.render("index", ["jokes": JokeArr ])
//    }
    
    
    
    app.get("jokes") { req -> [Joke]  in
        
        
       
        
         
        
        return JokeArr
    }
    
    
    
    app.post("post") {
        req -> JokesResponse in
        let content = try req.content.decode(Joke.self)
        
        JokeArr.append(content)
        
        let JokeObject = JokesResponse(status: 201, jokes: [content], jokeMessage:"Successfully received Joke")
        
        return JokeObject;
    }
    
    
    
    //try app.register(collection: TodoController())
}
