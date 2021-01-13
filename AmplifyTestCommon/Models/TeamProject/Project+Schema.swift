// swiftlint:disable all
import Amplify
import Foundation

extension Project {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case name
    case team
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let project = Project.keys
    
    model.pluralName = "Projects"
    
    model.fields(
      .id(),
      .field(project.name, is: .optional, ofType: .string),
      .belongsTo(project.team, is: .optional, ofType: Team.self, targetName: "projectTeamId")
    )
    }
}
