package sensationcms

class AuthenticationFilters {

    def filters = {
		loginCheck(controllerExclude: 'user', controller: '*', action: '*') {
			before = {
				if (!session.user && !actionName.equals('login')) {
					redirect(controller: 'User', action: 'login')
					return false
				}
			}
		}       
    }
}
