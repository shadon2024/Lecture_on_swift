import Foundation


let authDict:Dictionary = ["admin":"admin123","user":"someone123","guest":"guest999","you":"yourpass","me":"mypass190"]

//create CustomErrors enum
public enum CustomErrors: Error {
    case AuthenticationError(message:String)
    //case invalidCredentials
}

extension CustomErrors: LocalizedError {
    public var errorDescription: String? {
        switch self{
            //case .invalidCredentials:
            //   return NSLocalizedString("Invalid Credentials", comment: "Invalid Credentials")
        //return "Invalid Credentials"
        case .AuthenticationError(message:let message):
            print(message)
            return "Invalid Credentials"
        }
    }
}
// create authenticate(userName:user,pass:pass) with return type Boolean
func authenticate(user:String,pass:String) throws -> Bool{
    print(user)
    print(pass)
    guard authDict[user] == pass else {
        throw CustomErrors.AuthenticationError(message: "Invalid Credentials")
    }
    return true
}
//Editable code ends here
//Uneditable code starts here
let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let user = readLine() else { fatalError("Bad input") }

guard let pass = readLine() else { fatalError("Bad input") }

do{
    let result = try authenticate(user:user,pass:pass)
    fileHandle.write((result ? "1" : "0").data(using: .utf8)!)
}catch CustomErrors.AuthenticationError(let message){
    fileHandle.write(message.data(using: .utf8)!)
}

