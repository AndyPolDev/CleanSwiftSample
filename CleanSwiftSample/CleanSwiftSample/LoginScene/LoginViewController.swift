import UIKit

protocol ILoginViewController: AnyObject {
	func render(viewModel: LoginModels.ViewModel)
}

class LoginViewController: UIViewController {
	private var interactor: ILoginInteractor?
	
	@IBOutlet weak var textFieldLogin: UITextField!
	@IBOutlet weak var textFieldPassword: UITextField!
	@IBAction func buttonPressed(_sender: UIButton) {
		if let email = textFieldLogin.text, let password = textFieldPassword.text {
			let request = LoginModels.Request(login: email, password: password)
			interactor?.login(request: request)
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		assembly()
	}
	
	func assembly() {
		let worker = LoginWorker()
		let presenter = LoginPresenter(viewController: self)
		interactor = LoginInteractor(worker: worker, presenter: presenter)
	}
}

extension LoginViewController: ILoginViewController {
	func render(viewModel: LoginModels.ViewModel) {
		let alert: UIAlertController
		
		if viewModel.success {
			alert = UIAlertController(
				title: "Success",
				message: viewModel.userName,
				preferredStyle: UIAlertController.Style.alert
			)
		} else {
			alert = UIAlertController(
				title: "Error",
				message: "Тhere may be a message here",
				preferredStyle: UIAlertController.Style.alert
			)
		}
		
		let action = UIAlertAction(title: "Ok", style: .default)
		alert.addAction(action)
		present(alert, animated: true)
	}
}
