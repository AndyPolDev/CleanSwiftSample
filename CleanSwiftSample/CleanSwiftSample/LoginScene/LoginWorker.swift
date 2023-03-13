import Foundation

public struct LoginDTO {
	var success: Int
	var login: String
	var lastLoginDate: Date
}

protocol ILoginWorker {
	func login(login: String, password: String) -> LoginDTO
}

class LoginWorker: ILoginWorker {
	func login(login: String, password: String) -> LoginDTO {
		 
		if login == "AndyPolDev@gmail.com", password == "123" {
			return LoginDTO(
				success: 1,
				login: login,
				lastLoginDate: Date()
			)
		} else {
			return LoginDTO(
				success: 0,
				login: login,
				lastLoginDate: Date()
			 )
		}
	}
}
